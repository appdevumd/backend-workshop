Write-Host "Checking for node..."

if (Get-Command node -ErrorAction SilentlyContinue) {
    Write-Host "Node found! Installing dependencies..."

    Push-Location ./backend/
    npm i
    Pop-Location

    Push-Location ./app/
    npm i
    Pop-Location

    '{"text": "Hi there client!"}' > ./backend/data.json

    Write-Host ""
    $backend_ip = Read-Host -Prompt "Enter an IP address that you can use to connect to this computer"
    "export const BACKEND_IP = `"$backend_ip`";" > ./backend/ip.js
    "export const BACKEND_IP = `"$backend_ip`";" > ./app/ip.js

    Write-Host ""
    Write-Host "DONE!" -ForegroundColor Green
} else {
    Write-Host "Unable to find node. Please install from https://nodejs.org/en/download/ or your Windows package manager of choice." -ForegroundColor Red
}
