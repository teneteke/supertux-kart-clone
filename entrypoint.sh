#!/bin/bash

# Godot設定ディレクトリの作成
mkdir -p /home/developer/.config/godot

# 権限の設定
chown -R developer:developer /home/developer/.config/godot

# X11の設定（GUIアプリケーション用）
export DISPLAY=${DISPLAY:-:0}

# 引数がない場合はbashを起動
if [ $# -eq 0 ]; then
    exec bash
else
    exec "$@"
fi