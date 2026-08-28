#!/bin/bash

dirs=(
    ../niri-git
    ../waybar-git
    ../libinput-no-middle
)

# 记录失败的包
failed=()

SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "$0")")" && pwd)
cd "$SCRIPT_DIR"

echo "$PKGDEST"

for d in "${dirs[@]}"; do
    cd "$d"
    
    if ! makepkg -si --noconfirm --needed; then
        failed+=("$(basename $d)")
        continue
    fi
done

if [ ${#failed[@]} -eq 0 ]; then
    echo "✓ 全部成功！"
else
    echo "✗ 失败的包 (${#failed[@]}个)："
    for pkg in "${failed[@]}"; do
        echo "  - $pkg"
    done
fi