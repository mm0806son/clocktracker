# ClockTracker 语言切换开发任务

## 📋 任务概述

为 ClockTracker 项目添加中英文切换功能，使用项目自带的 Docker 环境，确保不影响 OpenClaw 和飞牛OS的原有环境。

## 🎯 目标

1. 提取所有硬编码的英文文本到翻译文件
2. 集成 @nuxtjs/i18n 模块
3. 添加语言切换 UI
4. 确保中文翻译符合钟楼百科官方译名

## ✅ 已完成

- ✅ Clone 项目到 `workspace/projects/clocktracker`
- ✅ 已有 `locales/zh-CN.ts` - 完整的中文翻译
- ✅ 已有 `locales/i18n.config.ts` - i18n 配置
- ✅ 已有 `components/LanguageSwitcher.vue` - 语言切换组件
- ✅ 已更新 `nuxt.config.ts` - 添加 i18n 模块配置

## 📝 待完成任务

### 任务 1：提取英文文本并创建翻译文件
**优先级：高**
**预估时间：2-3小时**

**描述：**
从原始代码中提取所有硬编码的英文文本，创建 `locales/en.ts` 文件。

**步骤：**
1. 扫描所有 `.vue` 和 `.ts` 文件
2. 提取硬编码的文本（如 "ClockTracker", "Blood on the Clocktower" 等）
3. 创建 `locales/en.ts`，结构与 `zh-CN.ts` 对应
4. 确保所有键名与 `zh-CN.ts` 一致

**验证：**
- `locales/en.ts` 包含所有必要的翻译键
- 文件结构正确，可以被 i18n 加载

### 任务 2：在组件中使用 i18n
**优先级：高**
**预估时间：3-4小时**

**描述：**
将硬编码的文本替换为 `$t()` 函数调用。

**步骤：**
1. 识别需要翻译的组件
2. 替换硬编码文本为 `{{ $t('key') }}`
3. 在 `<script>` 中使用 `const { $t } = useI18n()`
4. 处理动态文本和插值

**重点组件：**
- `components/LandingPage.vue`
- `components/Navigation.vue`
- `pages/*.vue`
- `app.vue`

**验证：**
- 所有文本正确显示
- 语言切换时文本更新

### 任务 3：集成语言切换器到 UI
**优先级：中**
**预估时间：1-2小时**

**描述：**
将 `LanguageSwitcher.vue` 组件集成到应用的合适位置。

**步骤：**
1. 选择合适的位置（如导航栏、设置页面）
2. 添加 `<LanguageSwitcher />` 组件
3. 确保样式与现有 UI 一致
4. 测试语言切换功能

**验证：**
- 语言切换器可见且易用
- 切换后文本正确更新
- 用户偏好保存到 cookie

### 任务 4：测试和验证
**优先级：中**
**预估时间：1-2小时**

**描述：**
全面测试语言切换功能，确保没有遗漏。

**测试项目：**
1. 所有页面文本正确翻译
2. 语言切换立即生效
3. 刷新页面后语言保持
4. 移动端显示正常
5. 没有控制台错误

**验证：**
- 创建测试清单
- 逐项测试并记录
- 修复发现的问题

### 任务 5：文档和清理
**优先级：低**
**预估时间：30分钟**

**描述：**
更新文档，清理临时文件。

**步骤：**
1. 更新 `README.md`，添加语言切换说明
2. 删除不必要的临时文件
3. 整理代码注释

**验证：**
- 文档清晰易懂
- 代码整洁

## 🛠️ 技术栈

- **框架：** Nuxt 3
- **i18n：** @nuxtjs/i18n
- **UI：** Tailwind CSS, Headless UI
- **开发环境：** Docker (项目自带)

## 📚 参考资料

- **钟楼百科：** https://clocktower-wiki.gstonegames.com/index.php?title=%E9%A6%96%E9%A1%B5
- **Nuxt i18n 文档：** https://i18n.nuxtjs.org/
- **现有翻译文件：** `locales/zh-CN.ts`

## ⚠️ 注意事项

1. **不要破坏现有环境**
   - 使用项目自带的 Docker
   - 所有依赖在容器内安装
   - 不要修改宿主机文件

2. **翻译准确性**
   - 严格遵循钟楼百科官方译名
   - 已有 `zh-CN.ts` 可参考

3. **性能优化**
   - 使用 lazy loading
   - 避免不必要的重新渲染

## 🚀 启动开发

```bash
# 1. 启动 Docker 容器
cd /home/node/.openclaw/workspace/projects/clocktracker
docker-compose up -d

# 2. 进入容器
docker exec -it clocktracker-app sh

# 3. 安装依赖（如果需要）
npm install

# 4. 启动开发服务器
npm run dev
```

## 📞 协作

- **任务提交：** 在 #dev-queue 频道提交任务
- **进度更新：** 在 #dev-status 频道更新进度
- **问题讨论：** 在对应的开发频道讨论

---

**创建时间：** 2025-02-26
**状态：** 等待开发团队接手
**预估总时间：** 8-12小时
