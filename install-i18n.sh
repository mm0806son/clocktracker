#!/bin/bash
# 开发环境安装脚本
# 在 Docker 容器内安全安装依赖

set -e

echo "🚀 Setting up development environment..."

# 检查是否在 Docker 容器内
if [ ! -f /.dockerenv ]; then
    echo "⚠️  Not running in Docker container"
    echo "Please use: docker-compose -f docker-compose.dev.yml up"
    exit 1
fi

echo "📦 Installing @nuxtjs/i18n..."
npm install --save-dev @nuxtjs/i18n@next

echo "✅ Installation complete!"
echo "📝 Next steps:"
echo "1. Update nuxt.config.ts to add i18n module"
echo "2. Create language switcher component"
echo "3. Update code to use $t() function"

echo ""
echo "Restart the dev server to apply changes."
