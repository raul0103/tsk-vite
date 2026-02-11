/**
 * По умолчанию все табы открыты. По клику скрывает не активные табы
 * 
 * Обязательные аттрибуты для элементов
 * data-tab-parent - Основной блок с табами. Можно использовать несколько на странице
 * data-tab-navigations - Родительский блок с навигацией для табов
 * data-tab-contents - Родительский блок с контентом табов
 * data-tab-id - Всем дочерним элементам [data-tab-navigations] и [data-tab-contents]
 */

export default class TabHide {
    init() {
        // Находим все блоки с табами.
        const tab_parents = document.querySelectorAll('[data-tab-parent]')

        if (tab_parents.length == 0) return

        tab_parents.forEach(tab_parent => {
            const navigation_block = tab_parent.querySelector('[data-tab-navigations]')
            const content_block = tab_parent.querySelector('[data-tab-contents]')

            if (!navigation_block || !content_block) return

            const navigations = navigation_block.querySelectorAll('[data-tab-id]')
            const contents = content_block.querySelectorAll('[data-tab-id]')

            navigations.forEach(navigation => {
                navigation.addEventListener('click', (e) => this.events.navigationClick(navigation, navigations, contents))
            })

        })

    }

    events = {
        navigationClick: (navigation_target, navigations, contents) => {
            if (navigation_target.classList.contains('active')) {
                navigation_target.classList.remove('active')

                contents.forEach(content => content.classList.remove('hide'))
            } else {
                navigations.forEach(navigation => navigation.classList.remove('active'))

                navigation_target.classList.add('active')

                contents.forEach(content => {
                    if (content.dataset.tabId == navigation_target.dataset.tabId) {
                        content.classList.remove('hide')
                    } else {
                        content.classList.add('hide')
                    }

                })
            }

        },
    }
}