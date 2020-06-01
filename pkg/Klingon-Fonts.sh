#!/bin/bash

#
# 安装 Klingon-Fonts (CODE2000)
#

# 创建临时目录
mkdir -p "$HOME/.cache/pkg-tmp"

# 下载包
cd "$HOME/.cache/pkg-tmp"
curl -L "https://web.archive.org/web/20101122142710/http://code2000.net/CODE2000.ZIP" -O
cd ~

# 安装包
cd "$HOME/.cache/pkg-tmp"
7z x "CODE2000.ZIP" -o"CODE2000"
mkdir -p "$HOME/.config/Manual/Klingon-Fonts"
mv -f "CODE2000" "$HOME/.config/Manual/Klingon-Fonts/"
cd ~

# 赋予执行权限
# :

# 清理环境
rm -rf "$HOME/.cache/pkg-tmp"
sync
