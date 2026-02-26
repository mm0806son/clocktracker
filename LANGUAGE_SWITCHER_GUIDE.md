# ClockTracker 语言切换实现指南

## ✅ 已完成的工作

### 1. 翻译文件
- ✅ `locales/en.ts` - 完整的英文翻译
- ✅ `locales/zh-CN.ts` - 完整的中文翻译（已存在）
- ✅ `locales/i18n.config.ts` - i18n 配置

### 2. 配置文件
- ✅ 更新 `nuxt.config.ts` - 添加 @nuxtjs/i18n 模块
- ✅ 创建 `docker-compose.dev.yml` - 开发环境配置
- ✅ 创建 `install-i18n.sh` - 安装脚本

### 3. 组件
- ✅ 创建 `components/LanguageSwitcher.vue` - 语言切换组件

## 📋 下一步操作

### 步骤 1：启动开发环境

```bash
cd /home/node/.openclaw/workspace/projects/clocktracker

# 启动开发容器
docker-compose -f docker-compose.dev.yml up -d

# 进入容器
docker exec -it clocktracker-dev sh

# 运行安装脚本
./install-i18n.sh

# 重启开发服务器
npm run dev
```

### 步骤 2：在页面中使用语言切换组件

在任何页面或布局文件中添加：

```vue
<template>
  <div>
    <LanguageSwitcher />
    <!-- 其他内容 -->
  </div>
</template>
```

### 步骤 3：在代码中使用翻译

替换硬编码的文本：

```vue
<template>
  <div>
    <!-- 之前 -->
    <h1>Blood on the Clocktower</h1>

    <!-- 之后 -->
    <h1>{{ $t('game.name') }}</h1>
  </div>
</template>
```

### 步骤 4：测试

1. 访问 http://localhost:3001
2. 点击语言切换器
3. 验证页面文本是否正确切换

## 🔧 开发环境说明

### 为什么使用 Docker？

- **隔离性**：不影响飞牛OS的原有环境
- **一致性**：确保开发环境与生产环境一致
- **安全性**：避免依赖冲突

### 文件结构

```
clocktracker/
├── locales/
│   ├── en.ts           # 英文翻译
│   ├── zh-CN.ts        # 中文翻译
│   └── i18n.config.ts  # i18n 配置
├── components/
│   └── LanguageSwitcher.vue  # 语言切换组件
├── docker-compose.dev.yml    # 开发环境配置
├── install-i18n.sh          # 安装脚本
└── nuxt.config.ts           # Nuxt 配置（已更新）
```

## 🎯 翻译覆盖范围

### 已翻译的模块
- ✅ 应用标题和描述
- ✅ 导航菜单
- ✅ 认证相关
- ✅ 设置页面
- ✅ 统计页面
- ✅ 角色相关
- ✅ 游戏编辑器
- ✅ 仪表板
- ✅ 游戏名称和剧本
- ✅ 角色阵营

### 需要补充的翻译
如果发现未翻译的文本，可以：
1. 在对应语言的翻译文件中添加新的键值对
2. 在代码中使用 `$t('key')` 引用

## ⚠️ 注意事项

1. **不要直接修改 node_modules**
   - 使用 Docker 容器进行开发
   - 所有依赖通过 package.json 管理

2. **保存语言偏好**
   - 用户的语言选择会保存到 cookie
   - 下次访问时自动应用

3. **性能优化**
   - 翻译文件使用 lazy loading
   - 只加载当前语言

## 🚀 生产部署

当开发完成后，更新生产环境：

1. 更新 `package.json` 添加 `@nuxtjs/i18n` 依赖
2. 重新构建 Docker 镜像
3. 使用 `docker-compose up -d` 部署

## 📞 支持

如果遇到问题：
1. 检查 Docker 容器日志：`docker logs clocktracker-dev`
2. 检查浏览器控制台错误
3. 确认翻译文件路径正确

---

**创建时间：** 2025-02-26
**状态：** 准备就绪，等待启动开发环境
