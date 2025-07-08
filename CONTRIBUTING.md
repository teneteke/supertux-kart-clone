# Contributing to SuperTux Kart Clone

## 🎉 Welcome Contributors!

Thank you for your interest in contributing to our SuperTuxKart-inspired racing game! This project is built with Godot Engine and Docker to make collaboration easy.

## 🚀 Quick Start for Contributors

### 1. Setup Development Environment
```bash
# Clone your fork
git clone https://github.com/your-username/supertux-kart-clone.git
cd supertux-kart-clone

# Setup environment
./setup.sh

# Start development
docker-compose run --rm godot-editor
```

### 2. Development Workflow
```bash
# Create feature branch
git checkout -b feature/your-amazing-feature

# Make changes and test
docker-compose run --rm godot-editor

# Build and test
./tools/scripts/quick-build.sh

# Commit and push
git add .
git commit -m "Add: your amazing feature"
git push origin feature/your-amazing-feature
```

## 🎯 Areas for Contribution

### 🔥 High Priority
- [ ] Additional track designs
- [ ] New kart models and animations  
- [ ] More item types (weapons, shields, etc.)
- [ ] Multiplayer networking
- [ ] Better AI behavior

### 🟡 Medium Priority  
- [ ] Visual effects (particles, explosions)
- [ ] Sound effects and music
- [ ] UI improvements
- [ ] Performance optimizations
- [ ] Mobile platform support

### 🟢 Good First Issues
- [ ] Bug fixes
- [ ] Documentation improvements
- [ ] Code comments and cleanup
- [ ] New screenshots
- [ ] Translation to other languages

## 📝 Coding Guidelines

### GDScript Style
```gdscript
# Use snake_case for variables and functions
var player_speed = 10.0

# Use PascalCase for classes and nodes
class_name PlayerKart

# Add type hints
func move_forward(delta: float) -> void:
    position += transform.basis.z * speed * delta

# Comment complex logic
# Calculate the optimal racing line through this corner
var racing_line = calculate_racing_line(corner_entry, corner_exit)
```

### Project Structure
- **game/scripts/player/** - Player-related code
- **game/scripts/ai/** - AI behavior  
- **game/scripts/items/** - Item system
- **game/scripts/track/** - Track and environment
- **game/scripts/managers/** - Game state management

## 🧪 Testing

### Manual Testing
```bash
# Test basic gameplay
./tools/scripts/quick-build.sh
./build/supertux-kart-clone-debug.x86_64

# Test specific features
docker-compose run --rm godot-editor
# Use Godot's built-in testing tools
```

### Performance Testing
- Test with multiple AI karts (4+)
- Verify smooth 60 FPS gameplay
- Check memory usage during long races
- Test on different hardware configurations

## 🎨 Asset Guidelines

### 3D Models
- **Format**: .glb or .gltf preferred
- **Polygons**: Keep under 1000 triangles for karts
- **Textures**: 512x512 or 1024x1024 max
- **Style**: Simple, colorful, family-friendly

### Audio
- **Format**: .ogg preferred
- **Quality**: 44.1kHz, 16-bit
- **Length**: Sound effects under 3 seconds
- **Music**: Loopable background tracks

## 🐛 Bug Reports

### Bug Report Template
```markdown
## Bug Description
Brief description of the issue

## Steps to Reproduce
1. Start game
2. Select race mode
3. ...

## Expected Behavior
What should happen

## Actual Behavior  
What actually happens

## Environment
- OS: Linux/Windows/macOS
- Docker version: X.X.X
- Hardware: CPU/GPU details
```

## 💡 Feature Requests

### Feature Request Template  
```markdown
## Feature Description
Clear description of the proposed feature

## Use Case
Why would this feature be useful?

## Implementation Ideas
How might this feature work?

## Additional Context
Any other relevant information
```

## 🎊 Recognition

Contributors will be:
- Listed in README.md acknowledgments
- Tagged in release notes for their contributions
- Invited to project decision discussions
- Given commit access after consistent contributions

## 📞 Questions?

- 💬 **Discussions**: Use GitHub Discussions for questions
- 🐛 **Issues**: Use GitHub Issues for bugs
- 📧 **Direct Contact**: [Contact maintainers]

## 📜 Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help newcomers learn
- Keep discussions on-topic
- Have fun building an awesome game together!

---

**Happy Coding! 🎮**