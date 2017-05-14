echo 'Installing Node.js...'
Install-Product node $env:nodejs_version

echo 'Installing yarn... '
choco install yarn
