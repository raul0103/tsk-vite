import { getLastValidBackUrl, trackPageVisit } from "./historyTracker";

document.addEventListener("DOMContentLoaded", () => {
  trackPageVisit();

  document.querySelector(".whBack")?.addEventListener("click", () => {
    const backUrl = getLastValidBackUrl("/");
    window.location.href = backUrl;
  });
});
