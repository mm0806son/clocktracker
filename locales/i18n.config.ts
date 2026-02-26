import { en } from './en'
import { zhCN } from './zh-CN'

export default defineI18nConfig(() => ({
  legacy: false,
  locale: 'en',
  fallbackLocale: 'en',
  messages: {
    en,
    'zh-CN': zhCN
  }
}))
