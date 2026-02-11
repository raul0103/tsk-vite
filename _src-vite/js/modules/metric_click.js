/**
 * ===============================
 *  Yandex.Metrica Goals Tracker
 * ===============================
 *
 * 🔹 Назначение:
 * Универсальный трекер для Яндекс.Метрики, позволяющий:
 * - Отслеживать события (`click`, `submit`, `mouseenter` и т.д.) на элементах;
 * - Работать с разными контекстами (например, "rockwool", "osb");
 * - Строить последовательности событий через `before`;
 * - Хранить состояние и последний шаг в `localStorage`, чтобы цепочки не сбрасывались при обновлении страницы.
 *
 * 🔹 Как использовать:
 *
 * 1. В HTML указываем элемент и ключ конфига:
 *    <button data-metrica-config="rockwool-banner">Баннер Rockwool</button>
 *
 * 2. В JS задаём конфигурацию под этим ключом:
 *
 *    const metricaConfigs = {
 *      "rockwool-banner": {
 *          context: "rockwool",                  // имя цепочки
 *          event: "click",                       // событие DOM
 *          before: [],                           // зависимости (пусто = можно сразу)
 *          goal: "banner-v-kataloge-klik"        // цель Метрики
 *      },
 *      "rockwool-banner-form": {
 *          context: "rockwool",
 *          event: "submit",
 *          before: ["banner-v-kataloge-klik"],   // должно быть выполнено до этого
 *          goal: "banner-v-kataloge-otpravka-formy"
 *      }
 *    };
 *
 * 3. Если на элементе несколько сценариев — перечисляем ключи через запятую:
 *    <form data-metrica-config="rockwool-banner-form, rockwool-product-banner-form">
 *      ...
 *    </form>
 *
 * 🔹 Примеры сценариев:
 *
 * a) Клик по баннеру → отправка формы:
 *    - "rockwool-banner"      (click → goal: banner-v-kataloge-klik)
 *    - "rockwool-banner-form" (submit → goal: banner-v-kataloge-otpravka-formy, before: [banner-v-kataloge-klik])
 *
 * b) Два разных баннера в одном контексте:
 *    - "rockwool-banner"             (goal: banner-v-kataloge-klik)
 *    - "rockwool-product-banner"     (goal: banner-osb-v-kartochke-tovara-kliki)
 *    - У каждого есть своя форма с `before`, завязанная только на свой баннер.
 *
 * 🔹 Хранение состояния:
 * - STORAGE_KEY: список выполненных целей по контекстам.
 * - LAST_KEY: последняя цель в каждом контексте.
 *
 * Таким образом:
 * - `before` проверяется по последнему шагу в текущем контексте;
 * - Форма для баннера А не сработает, если последним действием был баннер Б.
 *
 */

const counterId = 86220330;
const metricaConfigs = {
    "rockwool-banner": {
        context: "rockwool",
        event: "click",
        before: [],
        goal: "banner-v-kataloge-klik"
    },
    "rockwool-banner-form": {
        context: "rockwool",
        event: "submit",
        before: ["banner-v-kataloge-klik"],
        goal: "banner-v-kataloge-otpravka-formy"
    },

    "rockwool-product-banner": {
        context: "rockwool",
        event: "click",
        before: [],
        goal: "banner-osb-v-kartochke-tovara-kliki"
    },
    "rockwool-product-banner-form": {
        context: "rockwool",
        event: "submit",
        before: ["banner-osb-v-kartochke-tovara-kliki"],
        goal: "banner-osb-v-kartochke-otvara-otpravka-formy"
    },
};

const STORAGE_KEY = "completedGoalsByContext";
const LAST_KEY = "lastStepByContext";

function loadState(key) {
    try {
        return JSON.parse(localStorage.getItem(key) || "{}");
    } catch (e) {
        return {};
    }
}
function saveState(key, data) {
    localStorage.setItem(key, JSON.stringify(data));
}

let completedByContext = loadState(STORAGE_KEY);
let lastStepByContext = loadState(LAST_KEY);

function depsDone(context, deps) {
    if (!deps || deps.length === 0) return true;

    // проверяем именно последнюю цель
    const last = lastStepByContext[context];
    if (!last) return false;

    return deps.includes(last);
}
try{

    document.querySelectorAll("[data-metrica-config]").forEach(el => {
        const keys = el.dataset.metricaConfig
            .split(",")
            .map(k => k.trim())
            .filter(Boolean);

        keys.forEach(key => {
            const cfg = metricaConfigs[key];
            if (!cfg) {
                console.warn("⚠ Нет конфига для ключа:", key);
                return;
            }

            const eventType = cfg.event || "click";
            const goals = Array.isArray(cfg.goal) ? cfg.goal : [cfg.goal];
            const deps = cfg.before || [];
            const context = cfg.context || "global";

            el.addEventListener(eventType, function () {
                goals.forEach(goal => {
                    if (!depsDone(context, deps)) {
                        console.log(`⛔ Goal "${goal}" (context: ${context}) не отправлен — ждём предыдущий шаг: [${deps}]`);
                        return;
                    }

                    ym(counterId, "reachGoal", goal);

                    if (!completedByContext[context]) {
                        completedByContext[context] = [];
                    }
                    if (!completedByContext[context].includes(goal)) {
                        completedByContext[context].push(goal);
                        saveState(STORAGE_KEY, completedByContext);
                    }

                    // фиксируем последний шаг
                    lastStepByContext[context] = goal;
                    saveState(LAST_KEY, lastStepByContext);

                });
            });
        });
    });

}catch (e){
    console.log(e);
}