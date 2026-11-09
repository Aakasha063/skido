/**
 * Which optional Saturday session the user picked for this week (Plan tab). It only
 * decides what Home offers as "today" on Saturday, so it's kept on the device.
 */
const key = (uid: string | undefined) => `skido:saturday:${uid ?? "anon"}`;

export function getSaturdayChoice(uid: string | undefined) {
  try {
    return localStorage.getItem(key(uid));
  } catch {
    return null;
  }
}

export function setSaturdayChoice(uid: string | undefined, slug: string) {
  try {
    localStorage.setItem(key(uid), slug);
  } catch {
    // best-effort
  }
}
