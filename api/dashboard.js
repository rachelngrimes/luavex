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

    // ping - just password check
    if (action === 'ping') {
        return res.status(400).json({ ok: true })
    }

    // list scripts
    if (action === 'list') {
        try {
            const { data: idFile } = await octokit.repos.getContent({
                owner: OWNER, repo: REPO,
                path: "api/files/v4/loaders/[id].js",
                ref: BRANCH
            })
            const content = Buffer.from(idFile.content, 'base64').toString('utf8')
            const matches = [...content.matchAll(/"([a-f0-9]{32})":\s*"(.+?)\.lua"/g)]
            const scripts = matches.map(m => ({ id: m[1], name: m[2] }))
            return res.status(200).json({ success: true, scripts })
        } catch (err) {
            return res.status(500).json({ error: err.message })
        }
    }

    // upload new script
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

            const { data: currentFile } = await octokit.repos.getContent({
                owner: OWNER, repo: REPO,
                path: "api/files/v4/loaders/[id].js",
                ref: BRANCH
            })

            let currentContent = Buffer.from(currentFile.content, "base64").toString("utf8")

            const newEntry = `        "${scriptId}": "${scriptName}.lua",`
            currentContent = currentContent.replace(
                /const scriptMap = \{/,
                `const scriptMap = {\n${newEntry}`
            )

            const newHtmlBlock = `
        if (id === "${scriptId}") {
            return res.status(401).send(\`<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LuaVex</title>
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: #0f1117; color: white; font-family: 'Inter', sans-serif; min-height: 100vh; display: flex; flex-direction: column; align-items: center; justify-content: center; }
        .title { font-size: 20px; font-weight: 600; margin-bottom: 20px; display: flex; align-items: center; gap: 8px; }
        .title span { font-size: 22px; }
        .code-box { background: #1a1d27; border: 1px solid #2a2d3a; border-radius: 10px; width: 700px; max-width: 95vw; overflow: hidden; }
        .code-header { display: flex; justify-content: space-between; align-items: center; padding: 16px; }
        .code-content { font-family: 'JetBrains Mono', monospace; font-size: 13px; line-height: 1.7; flex: 1; overflow-x: auto; white-space: nowrap; }
        .code-content .fn { color: #7aa2f7; } .code-content .keyword { color: #e0af68; } .code-content .string { color: #9ece6a; } .code-content .comment { color: #6b7a99; font-style: italic; }
        .copy-btn { background: #2a2d3a; color: #a9b1d6; border: 1px solid #3a3d4a; border-radius: 6px; padding: 4px 14px; font-size: 13px; cursor: pointer; font-family: 'Inter', sans-serif; flex-shrink: 0; margin-left: 16px; transition: background 0.2s; }
        .copy-btn:hover { background: #3a3d4a; color: white; }
        .scrollbar-wrap { border-top: 1px solid #2a2d3a; padding: 6px 16px; display: flex; align-items: center; gap: 6px; }
        .scrollbar-wrap span { color: #3a3d4a; font-size: 16px; } .scrollbar-track { flex: 1; height: 4px; background: #2a2d3a; border-radius: 2px; }
        .footnote { margin-top: 16px; font-size: 13px; color: #4a5068; }
        .footnote a { color: #4a5068; text-decoration: none; } .footnote a:hover { color: #7aa2f7; }
    </style>
</head>
<body>
    <div class="title"><span>📋</span> Loadstring</div>
    <div class="code-box">
        <div class="code-header">
            <div class="code-content">
                <div><span class="comment">-- made by a fucking demon</span></div>
                <div><span class="fn">loadstring</span>(<span class="keyword">game</span>:<span class="fn">HttpGet</span>(<span class="string">"https://luavex.vercel.app/files/v4/loaders/${scriptId}"</span>))()</div>
            </div>
            <button class="copy-btn" onclick="copyCode()">Copy</button>
        </div>
        <div class="scrollbar-wrap"><span>◀</span><div class="scrollbar-track"></div><span>▶</span></div>
    </div>
    <div class="footnote">Contents can not be displayed on browser • <a href="#">https://luavex.vercel.app/</a></div>
    <script>
        function copyCode() {
            navigator.clipboard.writeText('-- made by a fucking demon\\\\nloadstring(game:HttpGet("https://luavex.vercel.app/files/v4/loaders/${scriptId}"))()')
            const btn = document.querySelector('.copy-btn')
            btn.innerText = 'Copied!'
            setTimeout(() => btn.innerText = 'Copy', 2000)
        }
    </script>
</body>
</html>\`)
        }
`
            currentContent = currentContent.replace(
                `        return res.status(404).send`,
                `${newHtmlBlock}        return res.status(404).send`
            )

            await octokit.repos.createOrUpdateFileContents({
                owner: OWNER, repo: REPO,
                path: "api/files/v4/loaders/[id].js",
                message: `Add loader for: ${scriptName}`,
                content: Buffer.from(currentContent).toString("base64"),
                sha: currentFile.sha,
                branch: BRANCH
            })

            return res.status(200).json({
                success: true,
                loader: `loadstring(game:HttpGet("https://luavex.vercel.app/files/v4/loaders/${scriptId}"))()`
            })
        } catch (err) {
            return res.status(500).json({ error: "GitHub API error: " + err.message })
        }
    }

    // update existing script content
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

    // delete script
    if (action === 'delete') {
        try {
            const { data: currentFile } = await octokit.repos.getContent({
                owner: OWNER, repo: REPO,
                path: "api/files/v4/loaders/[id].js",
                ref: BRANCH
            })

            let currentContent = Buffer.from(currentFile.content, "base64").toString("utf8")

            // Remove scriptMap entry
            currentContent = currentContent.replace(
                new RegExp(`\\s*"${scriptId}":\\s*"${scriptName}\\.lua",?\\n?`, 'g'), '\n'
            )

            // Remove HTML block for this id
            const blockRegex = new RegExp(
                `\\s*if \\(id === "${scriptId}"\\) \\{[\\s\\S]*?\\}\\s*\n`, 'g'
            )
            currentContent = currentContent.replace(blockRegex, '\n')

            await octokit.repos.createOrUpdateFileContents({
                owner: OWNER, repo: REPO,
                path: "api/files/v4/loaders/[id].js",
                message: `Delete loader for: ${scriptName}`,
                content: Buffer.from(currentContent).toString("base64"),
                sha: currentFile.sha,
                branch: BRANCH
            })

            // Delete the lua file
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
