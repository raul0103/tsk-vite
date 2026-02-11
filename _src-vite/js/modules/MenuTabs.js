/**
 * data-menu-tabs - Основной блок меню
 * data-menu-tabs-navigations - Родительский блок кнопок нафигации
 * data-menu-tabs-contents - Родительский блок с контентом каждого таба
 * data-menu-tabs-id - Дочерние элементы [data-menu-tabs-navigations],[data-menu-tabs-contents]
 */
export default class MenuTabs {
    constructor() {
        this.active_content = null
        this.active_navigate = null
    }
    init() {
        const menu_tabs = document.querySelector('[data-menu-tabs]')
        if (!menu_tabs) return

        const navigations = menu_tabs.querySelector('[data-menu-tabs-navigations]')
        const contents = menu_tabs.querySelector('[data-menu-tabs-contents]')
        if (!navigations || !contents) return

        navigations.querySelectorAll('[data-menu-tabs-id]').forEach(navigation => {
            navigation.addEventListener('mouseenter', (e) => {
                this.events.navigationHover(e.target, navigations, contents)
            })
        })
    }

    events = {
        navigationHover: (target, navigations, contents) => {
            if (this.active_navigate) this.active_navigate.classList.remove('active')
            else navigations.querySelector('.active[data-menu-tabs-id]').classList.remove('active')
            if (this.active_content) this.active_content.classList.remove('active')
            else contents.querySelector('.active[data-menu-tabs-id]').classList.remove('active')

            const content = contents.querySelector(`[data-menu-tabs-id="${target.dataset.menuTabsId}"]`)
            content.classList.add('active')
            target.classList.add('active')

            this.active_navigate = content
            this.active_content = target
        }
    }

}
