import { en } from "./locales/en";
import { zhCN } from "./locales/zh-CN";

export default defineI18nConfig(() => ({
  legacy: false,
  locale: "zh-CN",
  messages: {
    en,
    "zh-CN": zhCN,
  },
}));
