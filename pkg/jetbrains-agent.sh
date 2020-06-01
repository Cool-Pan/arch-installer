#!/bin/bash

#
# 安装 jetbrains-agent
#

# 创建临时目录
mkdir -p "$HOME/.cache/pkg-tmp"

# 下载包
cd "$HOME/.cache/pkg-tmp"
# curl -L "https://1drv.ms/u/s!Atf-z4aXHKwchzJnHEEGu-zKhzUn?e=q8aAgb" -O
cd ~

# 安装包
cd "$HOME/.cache/pkg-tmp"
7z x "jetbrains-agent-latest.zip"
mv -f "jetbrains-agent" "$HOME/.config/Manual/"
cd ~

# 赋予执行权限
# :

# 清理环境
rm -rf "$HOME/.cache/pkg-tmp"
sync
