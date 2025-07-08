#!/bin/bash

echo "=== Git Repository Setup ==="
echo ""

# Git初期化
if [ ! -d ".git" ]; then
    echo "🔧 Initializing Git repository..."
    git init
else
    echo "✅ Git repository already exists"
fi

# gitignore確認
if [ -f ".gitignore" ]; then
    echo "✅ .gitignore found"
else
    echo "❌ .gitignore not found"
    exit 1
fi

# ファイルをステージング
echo "📦 Adding files to Git..."
git add .

# 初回コミット
echo "💾 Creating initial commit..."
git commit -m "🎉 Initial commit: SuperTux Kart Clone

✨ Features:
- 🏁 Complete 3D kart racing game
- 🎮 Player vs AI racing
- ⚡ Speed boost items
- 🌟 Wheel animations & engine sounds
- 🐳 Docker development environment
- 🔧 Cross-platform builds (Linux/Windows)

🛠️ Tech Stack:
- Godot 4.2.1
- GDScript
- Docker
- MIT License

🚀 Ready for collaborative development!"

echo ""
echo "✅ Git repository setup complete!"
echo ""
echo "🚀 Next steps:"
echo "1. Create GitHub repository"
echo "2. Add remote origin:"
echo "   git remote add origin https://github.com/YOUR-USERNAME/supertux-kart-clone.git"
echo "3. Push to GitHub:"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "📸 Don't forget to:"
echo "- Take screenshots of the game"
echo "- Update README.md with actual screenshots"
echo "- Create first release after testing"