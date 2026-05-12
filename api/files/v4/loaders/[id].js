import fs from 'fs'
import path from 'path'

export default function handler(req, res) {
    const ua = req.headers['user-agent'] || ''
    const isBrowser = ua.includes('Mozilla') || ua.includes('Chrome')
    const { id } = req.query

    if (isBrowser) {
        if (id === "705e7fe7aa288f0fe86900cedb1119b1") {
            return res.status(401).send(`<!DOCTYPE html>
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
        .code-content .fn { color: #7aa2f7; }
        .code-content .keyword { color: #e0af68; }
        .code-content .string { color: #9ece6a; }
        .code-content .comment { color: #6b7a99; font-style: italic; }
        .copy-btn { background: #2a2d3a; color: #a9b1d6; border: 1px solid #3a3d4a; border-radius: 6px; padding: 4px 14px; font-size: 13px; cursor: pointer; font-family: 'Inter', sans-serif; flex-shrink: 0; margin-left: 16px; transition: background 0.2s; }
        .copy-btn:hover { background: #3a3d4a; color: white; }
        .scrollbar-wrap { border-top: 1px solid #2a2d3a; padding: 6px 16px; display: flex; align-items: center; gap: 6px; }
        .scrollbar-wrap span { color: #3a3d4a; font-size: 16px; }
        .scrollbar-track { flex: 1; height: 4px; background: #2a2d3a; border-radius: 2px; }
        .footnote { margin-top: 16px; font-size: 13px; color: #4a5068; }
        .footnote a { color: #4a5068; text-decoration: none; }
        .footnote a:hover { color: #7aa2f7; }
    </style>
</head>
<body>
    <div class="title"><span>📋</span> Loadstring</div>
    <div class="code-box">
        <div class="code-header">
            <div class="code-content">
                <div><span class="comment">-- made by a fucking demon</span></div>
                <div><span class="fn">loadstring</span>(<span class="keyword">game</span>:<span class="fn">HttpGet</span>(<span class="string">"https://luavex.vercel.app/files/v4/loaders/705e7fe7aa288f0fe86900cedb1119b1"</span>))()</div>
            </div>
            <button class="copy-btn" onclick="copyCode()">Copy</button>
        </div>
        <div class="scrollbar-wrap"><span>◀</span><div class="scrollbar-track"></div><span>▶</span></div>
    </div>
    <div class="footnote">Contents can not be displayed on browser • <a href="#">https://luavex.vercel.app/</a></div>
    <script>
        function copyCode() {
            navigator.clipboard.writeText('-- made by a fucking demon\\nloadstring(game:HttpGet("https://luavex.vercel.app/files/v4/loaders/705e7fe7aa288f0fe86900cedb1119b1"))()')
            const btn = document.querySelector('.copy-btn')
            btn.innerText = 'Copied!'
            setTimeout(() => btn.innerText = 'Copy', 2000)
        }
    </script>
</body>
</html>`)
        }

        if (id === "5f2b9a8c1d4e73f0a6c1e9b27d8846aa") {
            return res.status(401).send(`<!DOCTYPE html>
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
        .code-content .fn { color: #7aa2f7; }
        .code-content .keyword { color: #e0af68; }
        .code-content .string { color: #9ece6a; }
        .code-content .comment { color: #6b7a99; font-style: italic; }
        .copy-btn { background: #2a2d3a; color: #a9b1d6; border: 1px solid #3a3d4a; border-radius: 6px; padding: 4px 14px; font-size: 13px; cursor: pointer; font-family: 'Inter', sans-serif; flex-shrink: 0; margin-left: 16px; transition: background 0.2s; }
        .copy-btn:hover { background: #3a3d4a; color: white; }
        .scrollbar-wrap { border-top: 1px solid #2a2d3a; padding: 6px 16px; display: flex; align-items: center; gap: 6px; }
        .scrollbar-wrap span { color: #3a3d4a; font-size: 16px; }
        .scrollbar-track { flex: 1; height: 4px; background: #2a2d3a; border-radius: 2px; }
        .footnote { margin-top: 16px; font-size: 13px; color: #4a5068; }
        .footnote a { color: #4a5068; text-decoration: none; }
        .footnote a:hover { color: #7aa2f7; }
    </style>
</head>
<body>
    <div class="title"><span>📋</span> Loadstring</div>
    <div class="code-box">
        <div class="code-header">
            <div class="code-content">
                <div><span class="comment">-- made by a fucking demon</span></div>
                <div><span class="fn">loadstring</span>(<span class="keyword">game</span>:<span class="fn">HttpGet</span>(<span class="string">"https://luavex.vercel.app/files/v4/loaders/5f2b9a8c1d4e73f0a6c1e9b27d8846aa"</span>))()</div>
            </div>
            <button class="copy-btn" onclick="copyCode()">Copy</button>
        </div>
        <div class="scrollbar-wrap"><span>◀</span><div class="scrollbar-track"></div><span>▶</span></div>
    </div>
    <div class="footnote">Contents can not be displayed on browser • <a href="#">https://luavex.vercel.app/</a></div>
    <script>
        function copyCode() {
            navigator.clipboard.writeText('-- made by a fucking demon\\nloadstring(game:HttpGet("https://luavex.vercel.app/files/v4/loaders/5f2b9a8c1d4e73f0a6c1e9b27d8846aa"))()')
            const btn = document.querySelector('.copy-btn')
            btn.innerText = 'Copied!'
            setTimeout(() => btn.innerText = 'Copy', 2000)
        }
    </script>
</body>
</html>`)
        }
        body { background: #0f1117; color: white; font-family: 'Inter', sans-serif; min-height: 100vh; display: flex; flex-direction: column; align-items: center; justify-content: center; }
        .title { font-size: 20px; font-weight: 600; margin-bottom: 20px; display: flex; align-items: center; gap: 8px; }
        .title span { font-size: 22px; }
        .code-box { background: #1a1d27; border: 1px solid #2a2d3a; border-radius: 10px; width: 700px; max-width: 95vw; overflow: hidden; }
        .code-header { display: flex; justify-content: space-between; align-items: center; padding: 16px; }
        .code-content { font-family: 'JetBrains Mono', monospace; font-size: 13px; line-height: 1.7; flex: 1; overflow-x: auto; white-space: nowrap; }
        .code-content .fn { color: #7aa2f7; }
        .code-content .keyword { color: #e0af68; }
        .code-content .string { color: #9ece6a; }
        .code-content .comment { color: #6b7a99; font-style: italic; }
        .copy-btn { background: #2a2d3a; color: #a9b1d6; border: 1px solid #3a3d4a; border-radius: 6px; padding: 4px 14px; font-size: 13px; cursor: pointer; font-family: 'Inter', sans-serif; flex-shrink: 0; margin-left: 16px; transition: background 0.2s; }
        .copy-btn:hover { background: #3a3d4a; color: white; }
        .scrollbar-wrap { border-top: 1px solid #2a2d3a; padding: 6px 16px; display: flex; align-items: center; gap: 6px; }
        .scrollbar-wrap span { color: #3a3d4a; font-size: 16px; }
        .scrollbar-track { flex: 1; height: 4px; background: #2a2d3a; border-radius: 2px; }
        .footnote { margin-top: 16px; font-size: 13px; color: #4a5068; }
        .footnote a { color: #4a5068; text-decoration: none; }
        .footnote a:hover { color: #7aa2f7; }
    </style>
</head>
<body>
    <div class="title"><span>📋</span> Loadstring</div>
    <div class="code-box">
        <div class="code-header">
            <div class="code-content">
                <div><span class="comment">-- made by a fucking demon</span></div>
                <div><span class="fn">loadstring</span>(<span class="keyword">game</span>:<span class="fn">HttpGet</span>(<span class="string">"https://luavex.vercel.app/files/v4/loaders/c56596deaa1b55e944696ae4cd987325"</span>))()</div>
            </div>
            <button class="copy-btn" onclick="copyCode()">Copy</button>
        </div>
        <div class="scrollbar-wrap"><span>◀</span><div class="scrollbar-track"></div><span>▶</span></div>
    </div>
    <div class="footnote">Contents can not be displayed on browser • <a href="#">https://luavex.vercel.app/</a></div>
    <script>
        function copyCode() {
            navigator.clipboard.writeText('-- made by a fucking demon\\nloadstring(game:HttpGet("https://luavex.vercel.app/files/v4/loaders/c56596deaa1b55e944696ae4cd987325"))()')
            const btn = document.querySelector('.copy-btn')
            btn.innerText = 'Copied!'
            setTimeout(() => btn.innerText = 'Copy', 2000)
        }
    </script>
</body>
</html>`)
        }


        if (id === "4fb65fbbbc7e3749790d934a690fee9e") {
            return res.status(401).send(`<!DOCTYPE html>
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
                <div><span class="fn">loadstring</span>(<span class="keyword">game</span>:<span class="fn">HttpGet</span>(<span class="string">"https://luavex.vercel.app/files/v4/loaders/4fb65fbbbc7e3749790d934a690fee9e"</span>))()</div>
            </div>
            <button class="copy-btn" onclick="copyCode()">Copy</button>
        </div>
        <div class="scrollbar-wrap"><span>◀</span><div class="scrollbar-track"></div><span>▶</span></div>
    </div>
    <div class="footnote">Contents can not be displayed on browser • <a href="#">https://luavex.vercel.app/</a></div>
    <script>
        function copyCode() {
            navigator.clipboard.writeText('-- made by a fucking demon\\nloadstring(game:HttpGet("https://luavex.vercel.app/files/v4/loaders/4fb65fbbbc7e3749790d934a690fee9e"))()')
            const btn = document.querySelector('.copy-btn')
            btn.innerText = 'Copied!'
            setTimeout(() => btn.innerText = 'Copy', 2000)
        }
    </script>
</body>
</html>`)
        }
        return res.status(404).send(`<h1 style="background:black;color:white;text-align:center;padding-top:20%">404 Not Found</h1>`)
    }

    const scriptMap = {
        "4fb65fbbbc7e3749790d934a690fee9e": "1.lua",
        "705e7fe7aa288f0fe86900cedb1119b1": "myscript.lua",
        "5f2b9a8c1d4e73f0a6c1e9b27d8846aa": "myscript2.lua",
    }

    const filename = scriptMap[id]
    if (!filename) return res.status(404).send('-- script not found')

    const filePath = path.join(process.cwd(), 'scripts', filename)
    const script = fs.readFileSync(filePath, 'utf8')

    res.setHeader('Content-Type', 'text/plain')
    res.send(script)
}
