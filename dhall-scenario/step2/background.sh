GITHUB_PATH=https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/assets/"

cd /root

wget "${GITHUB_PATH}User.dhall"
wget "${GITHUB_PATH}Schema.dhall"
curl -L "${GITHUB_PATH}info.json" -o "incorrect_info.json"