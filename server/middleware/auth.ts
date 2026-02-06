import { serverSupabaseUser } from "#supabase/server";
import { serverSupabaseClient } from "#supabase/server";

export default defineEventHandler(async (event) => {
  try {
    // First, try to get user from cookies (standard flow)
    const user = await serverSupabaseUser(event);
    if (user) {
      event.context.user = user;
      return;
    }
  } catch (error) {
    // Cookies approach failed, try Authorization header
  }

  // Fallback: try to verify JWT from Authorization header
  try {
    const authHeader = getHeader(event, "authorization");
    if (authHeader && authHeader.startsWith("Bearer ")) {
      const token = authHeader.substring(7);
      const supabase = await serverSupabaseClient(event);

      // Verify the JWT token
      const { data, error } = await supabase.auth.getUser(token);

      if (!error && data.user) {
        event.context.user = data.user;
      }
    }
  } catch {
    // do nothing
  }
});
