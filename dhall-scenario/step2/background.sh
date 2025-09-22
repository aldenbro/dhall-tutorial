GITHUB_PATH=https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/assets/"

cd /root

wget "${GITHUB_URL}User.dhall"
wget "${GITHUB_URL}Schema.dhall"
curl -L "${GITHUB_URL}info.json" -o "incorrect_info.json"