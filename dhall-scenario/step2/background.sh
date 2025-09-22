FILE="secret.txt"

GITHUB_URL="https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/assets/${FILE}"

cd /root

[ -f "$GITHUB_URL" ] || wget "$GITHUB_URL"