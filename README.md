# 🏁 SuperTux Kart Clone

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Godot Engine](https://img.shields.io/badge/Godot-4.2.1-blue.svg)](https://godotengine.org/)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://www.docker.com/)

SuperTuxKartのような3DカートレーシングゲームをGodot Engineで開発するオープンソースプロジェクトです。

Docker環境により、友達と簡単に開発環境を共有できます！

## 📸 Screenshots

### 🎮 Main Menu
<!-- ![Main Menu](screenshots/main-menu.png) -->
*Screenshot coming soon - メインメニュー画面*

### 🏁 Racing Action  
<!-- ![Racing Action](screenshots/race-action.png) -->
*Screenshot coming soon - レース中の画面*

### 🤖 AI Competition
<!-- ![AI Competition](screenshots/ai-competition.png) -->
*Screenshot coming soon - AI対戦画面*

### ⚡ Speed Boost Effect
<!-- ![Speed Boost](screenshots/speed-boost.png) -->
*Screenshot coming soon - スピードブースト効果*

## 🚀 クイックスタート

### 必要なもの
- Docker
- Docker Compose

### セットアップ（友達向け）
1. このプロジェクトをダウンロード
2. ターミナルでプロジェクトフォルダに移動
3. セットアップスクリプトを実行：
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

### 開発コマンド

```bash
# 開発シェル起動
docker-compose run --rm godot-dev

# Godotエディタ起動（GUI）
docker-compose run --rm godot-editor

# 全サービス起動
docker-compose up
```

### ビルドコマンド

```bash
# 開発・テスト用クイックビルド
./tools/scripts/quick-build.sh

# 本格的なリリースビルド（Linux + Windows）
./tools/scripts/build.sh

# 手動ビルド（Dockerコンテナ内）
docker-compose run --rm godot-build
```

## 📁 プロジェクト構造

```
supertux-kart-clone/
├── game/           # Godotプロジェクト
├── tools/          # 開発ツール
├── docs/           # ドキュメント
├── build/          # ビルド成果物
├── Dockerfile      # Docker設定
├── docker-compose.yml
└── setup.sh        # セットアップスクリプト
```

## 🎮 ゲーム機能

### 実装済み ✅
- [x] 基本的なカート制御（WASD移動、方向転換）
- [x] 簡単なコース（直線コース、境界壁）
- [x] 3人称追従カメラ
- [x] 基本的な物理演算（衝突、重力、摩擦）
- [x] タイマーと速度表示
- [x] ゴールライン判定（3周でレース完了）
- [x] アイテムシステム（スピードブースト）
- [x] AIプレイヤー（基本的な直線走行）

### 操作方法
- **W/↑**: 前進
- **S/↓**: 後退  
- **A/←**: 左転回
- **D/→**: 右転回
- **Space**: アイテム使用
- **Shift**: ブレーキ
- **ESC**: メニューに戻る

### 拡張機能 ✅
- [x] コース拡張（カーブと障害物追加）
- [x] 車輪回転アニメーション（速度・ステアリング連動）
- [x] 音響効果（エンジン音、速度連動ピッチ変更）
- [x] ビルド設定（Linux/Windows実行ファイル作成）

### 🎯 プロジェクト完成度
- **高優先度機能**: 10/10 完了 ✅
- **中優先度機能**: 4/4 完了 ✅
- **低優先度機能**: 2/2 完了 ✅
- **総合進捗**: 16/16 (100%) 🎉

## 🛠️ 開発環境

- **ゲームエンジン**: Godot 4.2.1
- **開発環境**: Docker
- **言語**: GDScript
- **物理エンジン**: Godot Physics
- **OS**: Linux/macOS/Windows対応

## 🤝 Contributing

プルリクエストやイシューを歓迎します！

1. このリポジトリをフォーク
2. 機能ブランチを作成 (`git checkout -b feature/amazing-feature`)
3. 変更をコミット (`git commit -m 'Add amazing feature'`)
4. ブランチをプッシュ (`git push origin feature/amazing-feature`)
5. プルリクエストを作成

## 📝 License

このプロジェクトは [MIT License](LICENSE) の下で公開されています。

## 🙏 Acknowledgments

- [Godot Engine](https://godotengine.org/) - 素晴らしいゲームエンジン
- [SuperTuxKart](https://supertuxkart.net/) - インスピレーション元
- オープンソースコミュニティ

## 🔧 トラブルシューティング

### GUIが表示されない（Linux）
```bash
xhost +local:docker
```

### 権限エラー
```bash
sudo chown -R $USER:$USER .
```

### Dockerビルドエラー
```bash
docker-compose build --no-cache
```

## 🔄 Roadmap

### Version 1.0 ✅ (Current)
- Basic kart racing gameplay
- AI opponents
- Speed boost items
- Docker development environment

### Version 1.1 🚧 (Planned)
- [ ] Additional track designs
- [ ] New kart models
- [ ] More item types
- [ ] Particle effects

### Version 2.0 🎯 (Future)
- [ ] Multiplayer networking
- [ ] Tournament mode
- [ ] Character customization
- [ ] Mobile support

## 📊 Project Stats

![GitHub stars](https://img.shields.io/github/stars/YOUR-USERNAME/supertux-kart-clone?style=social)
![GitHub forks](https://img.shields.io/github/forks/YOUR-USERNAME/supertux-kart-clone?style=social)
![GitHub issues](https://img.shields.io/github/issues/YOUR-USERNAME/supertux-kart-clone)
![GitHub pull requests](https://img.shields.io/github/issues-pr/YOUR-USERNAME/supertux-kart-clone)