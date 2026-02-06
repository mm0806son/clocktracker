/**
 * Supabase Auth Plugin
 * Automatically adds JWT token to API requests for Supabase authentication
 * This is essential for internal network deployments where cookies may not work properly
 */
export default defineNuxtPlugin(() => {
  const supabase = useSupabaseClient();

  // Store current session token for API requests
  let currentToken: string | null = null;

  // Listen to auth state changes and update the token
  const { data: { subscription } } = supabase.auth.onAuthStateChange(
    async (event, session) => {
      if (session?.access_token) {
        currentToken = session.access_token;
      } else {
        currentToken = null;
      }
    }
  );

  // Initialize token from current session
  supabase.auth.getSession().then(({ data: { session } }) => {
    if (session?.access_token) {
      currentToken = session.access_token;
    }
  });

  // Override $fetch to add Authorization header
  const originalFetch = globalThis.$fetch;
  globalThis.$fetch = ((url: string, options: any = {}) => {
    // Skip adding auth header for non-API routes or external requests
    if (
      typeof url === "string" &&
      url.startsWith("/api/") &&
      currentToken
    ) {
      options.headers = options.headers || {};
      options.headers.Authorization = `Bearer ${currentToken}`;
    }
    return originalFetch(url, options);
  }) as typeof globalThis.$fetch;

  // Cleanup on unmount
  onUnmounted(() => {
    subscription?.unsubscribe();
  });
});
