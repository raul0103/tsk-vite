const HISTORY_KEY = 'visitHistory';

/**
 * Tracks the current page visit in sessionStorage.
 */
export function trackPageVisit() {
  const currentUrl = window.location.href;
  const historyList = JSON.parse(sessionStorage.getItem(HISTORY_KEY) || '[]');

  if (historyList.length === 0 || historyList[historyList.length - 1] !== currentUrl) {
    historyList.push(currentUrl);
    sessionStorage.setItem(HISTORY_KEY, JSON.stringify(historyList));
  }
}

/**
 * Gets the most recent valid same-host previous URL, or a fallback.
 * @param {string} fallbackUrl
 * @returns {string}
 */
export function getLastValidBackUrl(fallbackUrl = '/') {
  const currentUrl = window.location.href;
  const currentHost = window.location.host;
  const historyList = JSON.parse(sessionStorage.getItem(HISTORY_KEY) || '[]');

  for (let i = historyList.length - 2; i >= 0; i--) {
    try {
      const url = new URL(historyList[i]);
      if (url.href !== currentUrl && url.host === currentHost) {
        return url.href;
      }
    } catch {
      // ignore malformed
    }
  }

  return fallbackUrl;
}
