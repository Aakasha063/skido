// Mobile & PWA Notifications helper for Active Workouts and Rest Timers

export async function requestNotificationPermission(): Promise<boolean> {
  if (typeof window === "undefined" || !("Notification" in window)) {
    return false;
  }

  if (Notification.permission === "granted") {
    return true;
  }

  if (Notification.permission !== "denied") {
    try {
      const permission = await Notification.requestPermission();
      return permission === "granted";
    } catch {
      return false;
    }
  }

  return false;
}

export async function showWorkoutNotification({
  title,
  body,
  tag = "active-workout",
  vibrate = [200, 100, 200],
}: {
  title: string;
  body: string;
  tag?: string;
  vibrate?: number[];
}) {
  if (typeof window === "undefined" || !("Notification" in window)) return;
  if (Notification.permission !== "granted") return;

  try {
    // Try service worker registration first (works better on mobile/PWA background)
    if ("serviceWorker" in navigator) {
      const reg = await navigator.serviceWorker.getRegistration();
      if (reg) {
        await reg.showNotification(title, {
          body,
          tag,
          icon: "/icons/icon-192.png",
          badge: "/icons/icon-192.png",
          vibrate,
          silent: false,
        });
        return;
      }
    }

    // Fallback to standard Notification
    new Notification(title, {
      body,
      tag,
      icon: "/icons/icon-192.png",
    });
  } catch (err) {
    console.debug("Notification display error:", err);
  }
}

export function triggerHapticVibration(pattern: number[] = [300, 100, 300]) {
  if (typeof navigator !== "undefined" && "vibrate" in navigator) {
    try {
      navigator.vibrate(pattern);
    } catch {
      // Ignored if device doesn't support vibration
    }
  }
}

export async function clearWorkoutNotification(tag = "active-workout") {
  if (typeof window === "undefined" || !("serviceWorker" in navigator)) return;
  try {
    const reg = await navigator.serviceWorker.getRegistration();
    if (reg) {
      const notifications = await reg.getNotifications({ tag });
      notifications.forEach((n) => n.close());
    }
  } catch {
    // ignore
  }
}
