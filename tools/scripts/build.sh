#!/bin/bash

echo "=== SuperTux Kart Clone - Build Script ==="
echo ""

# ビルドディレクトリの作成
mkdir -p build

# Godotエクスポートテンプレートが必要な場合のメッセージ
echo "📦 Building game executables..."

# プラットフォーム別ビルド
echo "🐧 Building for Linux..."
docker-compose run --rm godot-build bash -c "godot --headless --export-release 'Linux/X11' ../build/supertux-kart-clone-linux.x86_64"

echo "🪟 Building for Windows..."
docker-compose run --rm godot-build bash -c "godot --headless --export-release 'Windows Desktop' ../build/supertux-kart-clone-windows.exe"

# ビルド結果の確認
echo ""
echo "📋 Build Results:"
ls -la build/

echo ""
echo "✅ Build completed!"
echo "📁 Executables are available in the 'build/' directory"
echo ""
echo "🚀 To run the game:"
echo "  Linux:   ./build/supertux-kart-clone-linux.x86_64"
echo "  Windows: ./build/supertux-kart-clone-windows.exe"