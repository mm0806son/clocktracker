<template>
  <div class="flex items-center gap-1">
    <button
      v-for="locale in locales"
      :key="locale"
      @click="switchLocale(locale)"
      :class="[
        'px-3 py-1 rounded text-sm font-medium transition-colors',
        locale === currentLocale
          ? 'bg-stone-600 text-white dark:bg-stone-400 dark:text-stone-900'
          : 'bg-transparent text-stone-700 dark:text-stone-300 hover:bg-stone-200 dark:hover:bg-stone-800'
      ]"
      :title="`Switch to ${getLocaleName(locale)}`"
    >
      {{ getLocaleName(locale) }}
    </button>
  </div>
</template>

<script setup lang="ts">
const i18n = useI18n();
const router = useRouter();

const locales = ["zh-CN", "en"] as const;

const currentLocale = computed(() => i18n.locale.value);

const getLocaleName = (locale: string): string => {
  const names: Record<string, string> = {
    en: "English",
    "zh-CN": "中文",
  };
  return names[locale] || locale;
};

const switchLocale = async (locale: string) => {
  if (locale === currentLocale.value) return;

  // Update i18n locale
  i18n.locale.value = locale;

  // Store preference in localStorage
  if (process.client) {
    localStorage.setItem("locale", locale);
  }

  // Navigate to the same route with new locale
  const currentPath = router.currentRoute.value.path;
  const pathWithoutLocale = currentPath.replace(/^\/(en|zh-CN)(?:\/|$)/, "/");

  if (locale === "zh-CN") {
    // Default locale, no prefix
    await router.push(pathWithoutLocale || "/");
  } else {
    // Add locale prefix
    await router.push(`/${locale}${pathWithoutLocale}`);
  }
};

// Load saved locale preference on mount
onMounted(() => {
  if (process.client) {
    const savedLocale = localStorage.getItem("locale");
    if (savedLocale && locales.includes(savedLocale as any)) {
      i18n.locale.value = savedLocale;
    }
  }
});
</script>
