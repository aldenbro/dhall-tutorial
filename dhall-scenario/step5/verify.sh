stat /root/alt_info.dhall

if diff -q <(dhall-to-json --file /root/info.dhall) <(dhall-to-json --file /root/alt_info.dhall) >/dev/null; then
    exit 0
else
    exit 1
fi

stat /root/info_json.dhall
stat /root/info_yaml.dhall

if diff -q "/root/info_json.dhall" "/root/info_yaml.dhall" >/dev/null; then
    exit 0
else
    exit 1
fi