
echo 'CONFIGURING REPOSITORY'
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo 'INSTALLING PACKAGES'
sudo apt-get update
sudo apt-get install yarn
