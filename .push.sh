#!/bin/bash
# cert-verify 一键推送脚本
# 用法: bash /Users/emma/Documents/cert-wufu/.push.sh
set -e
cd /Users/emma/Documents/cert-wufu
TOKEN=$(cat "$HOME/.config/gh-cert-wufu/token" 2>/dev/null || echo "")
if [ -z "$TOKEN" ]; then echo "ERROR: token 文件缺失"; exit 1; fi
git remote set-url origin "https://luckysky1013:${TOKEN}@github.com/luckysky1013/cert-wufu.git"
git add -A
git commit -m "${1:-add new cert pages}" || echo "(nothing to commit)"
git push origin main
git remote set-url origin "https://github.com/luckysky1013/cert-wufu.git"
echo "PUSHED. remote sanitized."
