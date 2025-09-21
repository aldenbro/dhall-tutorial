GITHUB_URL="https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/secret_assets/secret.txt"

cd /root

curl -fsSL "$GITHUB_URL" -o "secret.txt"