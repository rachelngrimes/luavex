import { Octokit } from "@octokit/rest";

const PASSWORD = process.env.DASHBOARD_PASSWORD
const GITHUB_TOKEN = process.env.GITHUB_TOKEN
const OWNER = "rachelngrimes"
const REPO = "luavex"
const BRANCH = "main"

const loginAttempts = {}

export default async function handler(req, res) {
    if (req.method !== "POST") return res.status(405).send("Method not allowed")

    const { password, action, scriptName, scriptContent, scriptId } = req.body
    const ip = req.headers['x-forwarded-for'] || 'unknown'

    // Rate limiting
    if (action !== 'ping') {
        if (!loginAttempts[ip]) loginAttempts[ip] = { count: 0, lockedUntil: 0 }
        if (loginAttempts[ip].lockedUntil > Date.now()) {
            const wait = Math.ceil((loginAttempts[ip].lockedUntil - Date.now()) / 1000)
            return res.status(429).json({ error: `Too many attempts. Wait ${wait}s.` })
        }
    }

    if (password !== PASSWORD) {
        if (!loginAttempts[ip]) loginAttempts[ip] = { count: 0, lockedUntil: 0 }
        loginAttempts[ip].count++
        if (loginAttempts[ip].count >= 5) {
            loginAttempts[ip].lockedUntil = Date.now() + 60000
            loginAttempts[ip].count = 0
            return res.status(429).json({ error: "Too many attempts. Locked for 60s." })
        }
        return res.status(401).json({ error: "Wrong password" })
    }

    if (loginAttempts[ip]) loginAttempts[ip] = { count: 0, lockedUntil: 0 }

    const octokit = new Octokit({ auth: GITHUB_TOKEN })

    if (action === 'ping') {
        return res.status(400).json({ ok: true })
    }

    if (action === 'list') {
        try {
            const { data } = await octokit.repos.getContent({
                owner: OWNER, repo: REPO,
                path: "scripts/manifest.json",
                ref: BRANCH
            })
            const manifest = JSON.parse(Buffer.from(data.content, 'base64').toString('utf8'))
            const scripts = Object.entries(manifest).map(([id, s]) => ({ id, name: s.name }))
            return res.status(200).json({ success: true, scripts })
        } catch (err) {
            return res.status(500).json({ error: err.message })
        }
    }

    if (action === 'upload') {
        try {
            const luaPath = `scripts/${scriptName}.lua`
            const luaContent = Buffer.from(scriptContent).toString("base64")

            await octokit.repos.createOrUpdateFileContents({
                owner: OWNER, repo: REPO,
                path: luaPath,
                message: `Add script: ${scriptName}`,
                content: luaContent,
                branch: BRANCH
            })

            const { data: manifestFile } = await octokit.repos.getContent({
                owner: OWNER, repo: REPO,
                path: "scripts/manifest.json",
                ref: BRANCH
            })

            const manifest = JSON.parse(Buffer.from(manifestFile.content, 'base64').toString('utf8'))
            manifest[scriptId] = { name: scriptName, file: `${scriptName}.lua` }

            await octokit.repos.createOrUpdateFileContents({
                owner: OWNER, repo: REPO,
                path: "scripts/manifest.json",
                message: `Add loader for: ${scriptName}`,
                content: Buffer.from(JSON.stringify(manifest, null, 4)).toString("base64"),
                sha: manifestFile.sha,
                branch: BRANCH
            })

            return res.status(200).json({
                success: true,
                loader: `loadstring(game:HttpGet("https://luavex.localplayer.dev/files/v4/loaders/${scriptId}"))()`
            })
        } catch (err) {
            return res.status(500).json({ error: "GitHub API error: " + err.message })
        }
    }

    if (action === 'update') {
        try {
            const luaPath = `scripts/${scriptName}.lua`
            const { data: existingFile } = await octokit.repos.getContent({
                owner: OWNER, repo: REPO,
                path: luaPath,
                ref: BRANCH
            })
            await octokit.repos.createOrUpdateFileContents({
                owner: OWNER, repo: REPO,
                path: luaPath,
                message: `Update script: ${scriptName}`,
                content: Buffer.from(scriptContent).toString("base64"),
                sha: existingFile.sha,
                branch: BRANCH
            })
            return res.status(200).json({ success: true })
        } catch (err) {
            return res.status(500).json({ error: "GitHub API error: " + err.message })
        }
    }

    if (action === 'delete') {
        try {
            const { data: manifestFile } = await octokit.repos.getContent({
                owner: OWNER, repo: REPO,
                path: "scripts/manifest.json",
                ref: BRANCH
            })

            const manifest = JSON.parse(Buffer.from(manifestFile.content, 'base64').toString('utf8'))
            const scriptData = manifest[scriptId]
            delete manifest[scriptId]

            await octokit.repos.createOrUpdateFileContents({
                owner: OWNER, repo: REPO,
                path: "scripts/manifest.json",
                message: `Delete loader for: ${scriptName}`,
                content: Buffer.from(JSON.stringify(manifest, null, 4)).toString("base64"),
                sha: manifestFile.sha,
                branch: BRANCH
            })

            const { data: luaFile } = await octokit.repos.getContent({
                owner: OWNER, repo: REPO,
                path: `scripts/${scriptName}.lua`,
                ref: BRANCH
            })
            await octokit.repos.deleteFile({
                owner: OWNER, repo: REPO,
                path: `scripts/${scriptName}.lua`,
                message: `Delete script: ${scriptName}`,
                sha: luaFile.sha,
                branch: BRANCH
            })

            return res.status(200).json({ success: true })
        } catch (err) {
            return res.status(500).json({ error: "GitHub API error: " + err.message })
        }
    }

    return res.status(400).json({ error: "Unknown action" })
}
