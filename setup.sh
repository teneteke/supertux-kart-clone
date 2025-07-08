#!/bin/bash

echo "=== SuperTux Kart Clone - Development Setup ==="
echo ""

# OSの確認
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    OS="windows"
else
    echo "❌ Unsupported OS: $OSTYPE"
    exit 1
fi

echo "🔍 Detected OS: $OS"

# Dockerの確認
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed"
    echo "Please install Docker first: https://docs.docker.com/get-docker/"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed"
    echo "Please install Docker Compose first"
    exit 1
fi

echo "✅ Docker and Docker Compose are installed"

# 必要なディレクトリの作成
echo "📁 Creating project directories..."
mkdir -p game
mkdir -p tools
mkdir -p docs
mkdir -p build

echo "✅ Project directories created"

# 権限の設定（Linux/macOS）
if [[ "$OS" == "linux" || "$OS" == "macos" ]]; then
    chmod +x entrypoint.sh
    echo "✅ Permissions set"
fi

# X11の設定（Linux）
if [[ "$OS" == "linux" ]]; then
    echo "🖥️  Setting up X11 for GUI applications..."
    xhost +local:docker 2>/dev/null || echo "⚠️  X11 setup failed (GUI may not work)"
fi

# Dockerイメージのビルド
echo "🐳 Building Docker image..."
docker-compose build

if [ $? -eq 0 ]; then
    echo "✅ Docker image built successfully"
else
    echo "❌ Docker image build failed"
    exit 1
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "🚀 Quick start commands:"
echo "  Development shell:    docker-compose run --rm godot-dev"
echo "  Godot editor:         docker-compose run --rm godot-editor"
echo "  Quick test build:     ./tools/scripts/quick-build.sh"
echo "  Full release build:   ./tools/scripts/build.sh"
echo ""
echo "📚 For more details, check the README.md file"

# ビルドスクリプトに実行権限を付与
if [[ "$OS" == "linux" || "$OS" == "macos" ]]; then
    chmod +x tools/scripts/build.sh
    chmod +x tools/scripts/quick-build.sh
    echo "✅ Build scripts permissions set"
fi