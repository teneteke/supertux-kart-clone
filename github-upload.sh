#!/bin/bash

echo "=== GitHub Upload Script ==="
echo ""

# GitHub情報の入力
read -p "GitHub username: " GITHUB_USER
read -p "Repository name (default: supertux-kart-clone): " REPO_NAME

# デフォルト値設定
REPO_NAME=${REPO_NAME:-supertux-kart-clone}

echo ""
echo "🔗 Setting up GitHub remote..."
git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git

echo "📤 Pushing to GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Successfully uploaded to GitHub!"
    echo ""
    echo "🌐 Your repository: https://github.com/$GITHUB_USER/$REPO_NAME"
    echo ""
    echo "📋 Next steps:"
    echo "1. 📸 Take screenshots of the game"
    echo "2. 🖼️ Upload screenshots to GitHub"
    echo "3. ✏️ Update README.md with actual image links"
    echo "4. 🏷️ Create your first release (v1.0.0)"
    echo "5. 🌟 Share with friends!"
    echo ""
    echo "🚀 Quick start for contributors:"
    echo "git clone https://github.com/$GITHUB_USER/$REPO_NAME.git"
    echo "cd $REPO_NAME"
    echo "./setup.sh"
else
    echo ""
    echo "❌ Upload failed. Please check:"
    echo "1. GitHub repository exists"
    echo "2. Repository name is correct"
    echo "3. You have push permissions"
    echo ""
    echo "🔧 Manual commands:"
    echo "git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git"
    echo "git push -u origin main"
fi