# ClockTracker 语言切换 - 完整实施指南

## 🎯 项目状态

**进度：** 60% 完成
**分支：** `feature/i18n-language-switcher`
**Commits：** 4 个

## ✅ 已完成的工作

### 1. 核心文件
- ✅ `locales/en.ts` - 完整的英文翻译（242 行）
- ✅ `locales/zh-CN.ts` - 完整的中文翻译（已存在）
- ✅ `locales/i18n.config.ts` - i18n 配置

### 2. UI 组件
- ✅ `components/LanguageSwitcher.vue` - 语言切换器
- ✅ 集成到 `components/Sidebar.vue`

### 3. 配置
- ✅ `nuxt.config.ts` - 添加 @nuxtjs/i18n 模块
- ✅ Git commits 记录完整

## 📝 剩余工作

### 任务 1：补充遗漏的翻译（可选）

**说明：**
项目已经部分集成了 i18n（如 `pages/add-game.vue`），大部分翻译已在 `zh-CN.ts` 中。

**如果发现未翻译的文本：**

1. **在 `locales/en.ts` 中添加：**
```typescript
export const en = {
  // ... 现有翻译
  newSection: {
    key: "English Text"
  }
}
```

2. **在 `locales/zh-CN.ts` 中添加：**
```typescript
export const zhCN = {
  // ... 现有翻译
  newSection: {
    key: "中文文本"
  }
}
```

3. **在代码中使用：**
```vue
<template>
  <div>{{ $t('newSection.key') }}</div>
</template>

<script setup>
const { t } = useI18n()
// 或在 JS 中：t('newSection.key')
</script>
```

### 任务 2：测试功能

**前提条件：**
- Supabase 运行（本地或远程）
- 数据库设置完成

**测试步骤：**

1. **启动开发服务器：**
```bash
cd /home/node/.openclaw/workspace/projects/clocktracker
npm install  # 如果需要
npm run dev
```

2. **访问应用：**
- 打开 http://localhost:3001
- 查看侧边栏底部的语言切换器

3. **测试语言切换：**
- 点击语言切换器
- 选择 "中文"
- 验证页面文本切换为中文
- 刷新页面，确认语言保持

4. **测试重点页面：**
- ✅ 首页（Landing Page）
- ✅ 登录页面
- ✅ 添加对局页面
- ✅ 设置页面

### 任务 3：修复问题（如果需要）

**常见问题：**

**问题 1：语言切换器不显示**
- 检查 `components/Sidebar.vue` 是否正确导入
- 检查浏览器控制台错误

**问题 2：翻译不生效**
- 检查翻译文件路径是否正确
- 检查翻译键名是否匹配
- 重启开发服务器

**问题 3：部分文本未翻译**
- 在对应的翻译文件中补充
- 确保键名结构一致

## 🚀 部署到生产

**步骤：**

1. **合并分支：**
```bash
git checkout main
git merge feature/i18n-language-switcher
```

2. **更新 package.json（如果需要）：**
```json
{
  "dependencies": {
    "@nuxtjs/i18n": "^8.0.0"
  }
}
```

3. **重新构建：**
```bash
npm run build
```

4. **部署：**
```bash
docker-compose up -d --build
```

## 📊 翻译覆盖率

**已翻译的模块：**
- ✅ 应用标题和描述
- ✅ 导航菜单（12 项）
- ✅ 认证相关（7 项）
- ✅ 设置页面（11 项）
- ✅ 统计页面（8 项）
- ✅ 角色相关（14 项）
- ✅ 游戏编辑器（60+ 项）
- ✅ 仪表板（20+ 项）
- ✅ 游戏名称和剧本（5 项）
- ✅ 角色阵营（5 项）

**预估覆盖率：** 90%+

## 🔧 技术细节

### i18n 配置

**`nuxt.config.ts` 配置：**
```typescript
i18n: {
  locales: [
    { code: 'en', name: 'English', file: 'en.ts' },
    { code: 'zh-CN', name: '中文', file: 'zh-CN.ts' }
  ],
  defaultLocale: 'en',
  strategy: 'no_prefix',
  lazy: true,
  langDir: 'locales',
  vueI18n: './locales/i18n.config.ts',
  detectBrowserLanguage: {
    useCookie: true,
    cookieKey: 'i18n_redirected',
    fallbackLocale: 'en'
  }
}
```

### 语言切换器组件

**`components/LanguageSwitcher.vue`：**
- 使用 Headless UI 的 Menu 组件
- 下拉菜单样式
- 自动保存用户偏好到 cookie

### 翻译文件结构

```
locales/
├── en.ts           # 英文翻译（主文件）
├── zh-CN.ts        # 中文翻译
└── i18n.config.ts  # i18n 配置
```

## 📚 参考资料

- **钟楼百科：** https://clocktower-wiki.gstonegames.com/
- **Nuxt i18n 文档：** https://i18n.nuxtjs.org/
- **Headless UI：** https://headlessui.com/

## 🎉 完成标准

功能被认为完成，当：
- ✅ 语言切换器可见且易用
- ✅ 切换后文本正确更新
- ✅ 用户偏好保存（刷新后保持）
- ✅ 主要页面文本已翻译
- ✅ 没有控制台错误
- ✅ 代码已 commit

## 📞 支持

如果遇到问题：
1. 检查浏览器控制台
2. 检查服务器日志
3. 确认翻译文件路径正确
4. 确认 i18n 配置正确

---

**创建时间：** 2026-02-26
**最后更新：** 2026-02-26 18:00
**状态：** 60% 完成，等待测试
**预估剩余时间：** 1-2 小时（测试 + 可能的修复）
