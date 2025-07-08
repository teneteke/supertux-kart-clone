#!/bin/bash

echo "=== Quick Build for Testing ==="
echo ""

# ビルドディレクトリの作成
mkdir -p build

# 現在のプラットフォームのみでビルド（高速）
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "🐧 Quick build for Linux..."
    docker-compose run --rm godot-build bash -c "godot --headless --export-debug 'Linux/X11' ../build/supertux-kart-clone-debug.x86_64"
    echo "✅ Debug build ready: ./build/supertux-kart-clone-debug.x86_64"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    echo "🪟 Quick build for Windows..."
    docker-compose run --rm godot-build bash -c "godot --headless --export-debug 'Windows Desktop' ../build/supertux-kart-clone-debug.exe"
    echo "✅ Debug build ready: ./build/supertux-kart-clone-debug.exe"
else
    echo "⚠️  Platform not detected, building for Linux..."
    docker-compose run --rm godot-build bash -c "godot --headless --export-debug 'Linux/X11' ../build/supertux-kart-clone-debug.x86_64"
    echo "✅ Debug build ready: ./build/supertux-kart-clone-debug.x86_64"
fi

echo ""
echo "🎮 Ready to test!"