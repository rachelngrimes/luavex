import fs from 'fs'
import path from 'path'

export default function handler(req, res) {
    const ua = req.headers['user-agent'] || ''
    const isBrowser = ua.includes('Mozilla') || ua.includes('Chrome')

    if (isBrowser) {
        return res.status(401).send(`<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <title>ACCESS DENIED | 404</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,500;14..32,600;14..32,700&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: #000000; font-family: 'Inter', system-ui, sans-serif; height: 100vh; width: 100%; display: flex; align-items: center; justify-content: center; position: relative; overflow: hidden; }
        .bg-pattern { position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: 0; opacity: 0.4; pointer-events: none; }
        .bg-pattern .dot-grid { position: absolute; width: 100%; height: 100%; background-image: radial-gradient(circle at 1px 1px, #2a2a2a 1px, transparent 1px); background-size: 40px 40px; }
        .bg-pattern .gradient-blur { position: absolute; top: -20%; right: -10%; width: 70%; height: 70%; background: radial-gradient(ellipse at center, rgba(60,60,60,0.25) 0%, rgba(0,0,0,0) 70%); filter: blur(80px); }
        .bg-pattern .gradient-blur-left { left: -20%; bottom: -20%; top: auto; right: auto; width: 60%; height: 60%; background: radial-gradient(ellipse at center, rgba(35,35,35,0.3) 0%, rgba(0,0,0,0) 70%); filter: blur(90px); }
        .access-card { position: relative; z-index: 10; max-width: 900px; width: 90%; padding: 3rem 2.5rem; background: rgba(10,10,10,0.7); backdrop-filter: blur(12px); border-radius: 2.5rem; border: 1px solid rgba(255,255,255,0.08); box-shadow: 0 25px 45px -12px rgba(0,0,0,0.8); transition: transform 0.3s ease, box-shadow 0.3s ease; text-align: center; }
        .access-card:hover { transform: translateY(-5px); box-shadow: 0 32px 55px -15px rgba(0,0,0,0.9); border-color: rgba(255,255,255,0.15); }
        .error-code { font-size: 10rem; font-weight: 800; letter-spacing: -0.03em; line-height: 1; background: linear-gradient(135deg, #ffffff 20%, #a0a0a0 80%); -webkit-background-clip: text; background-clip: text; color: transparent; margin-bottom: 1rem; }
        .denied-badge { display: inline-block; background: rgba(255,255,255,0.05); border: 0.5px solid rgba(255,255,255,0.2); border-radius: 100px; padding: 0.3rem 1.2rem; margin-bottom: 1.8rem; font-size: 0.85rem; font-weight: 500; letter-spacing: 1px; text-transform: uppercase; color: #dddddd; }
        .title { font-size: 2rem; font-weight: 600; color: #ffffff; margin-bottom: 1rem; }
        .message { font-size: 1rem; color: #b0b0b0; max-width: 520px; margin: 0 auto 1.5rem auto; line-height: 1.5; }
        .divider { width: 70px; height: 1px; background: rgba(255,255,255,0.2); margin: 1rem auto 1.2rem auto; }
        .lock-icon { font-size: 2rem; margin-bottom: 0.5rem; opacity: 0.7; }
        .footnote { margin-top: 1rem; font-size: 0.75rem; color: #6a6a6a; }
        .scan-overlay { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; background: repeating-linear-gradient(0deg, rgba(0,0,0,0.02) 0px, rgba(0,0,0,0.02) 1px, transparent 1px, transparent 4px); z-index: 20; }
        @media (max-width: 600px) { .access-card { padding: 2rem 1.5rem; border-radius: 1.8rem; } .error-code { font-size: 5.5rem; } .title { font-size: 1.6rem; } .message { font-size: 0.9rem; } }
    </style>
</head>
<body>
<div class="bg-pattern">
    <div class="dot-grid"></div>
    <div class="gradient-blur"></div>
    <div class="gradient-blur-left"></div>
</div>
<div class="access-card">
    <div class="lock-icon">⛔︎</div>
    <div class="error-code">404</div>
    <div class="denied-badge">ACCESS DENIED</div>
    <h1 class="title">Restricted Area</h1>
    <p class="message">The page you are looking for does not exist or you don't have permission to view it.<br>Your request has been logged. If you believe this is an error, verify the URL.</p>
    <div class="divider"></div>
    <div class="footnote">SECURITY PROTOCOL ACTIVE • REF: 0x4C3C_404A</div>
</div>
<div class="scan-overlay"></div>
<script>
    const card = document.querySelector('.access-card');
    if(card) {
        card.addEventListener('mousemove', (e) => {
            const xPos = (e.clientX / window.innerWidth) * 30;
            const yPos = (e.clientY / window.innerHeight) * 20;
            card.style.transform = 'translateY(-3px) rotateX(' + (yPos * 0.02) + 'deg) rotateY(' + (xPos * 0.02) + 'deg)';
        });
        card.addEventListener('mouseleave', () => {
            card.style.transform = 'translateY(0px) rotateX(0deg) rotateY(0deg)';
        });
    }
    const lock = document.querySelector('.lock-icon');
    if(lock){ setInterval(() => { lock.style.opacity = '0.85'; setTimeout(()=>{ lock.style.opacity = '0.7'; }, 700); }, 2000); }
</script>
</body>
</html>`)
    }

    const { id } = req.query
    const scriptMap = {
        "705e7fe7aa288f0fe86900cedb1119b1": "myscript.lua"
    }

    const filename = scriptMap[id]
    if (!filename) return res.status(404).send('-- script not found')

    const filePath = path.join(process.cwd(), 'scripts', filename)
    const script = fs.readFileSync(filePath, 'utf8')

    res.setHeader('Content-Type', 'text/plain')
    res.send(script)
}
