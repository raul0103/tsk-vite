/**
 * Все таблицы на странице статьи поместит в контейнер со скроллом по ширине экрана
 */
let padding = 30
document.querySelectorAll('.article table').forEach(table => {
    let div = document.createElement('div')
    div.style.overflow = 'auto'
    div.style.margin = 'auto'
    div.style.maxWidth = (window.innerWidth - padding) + 'px'

    let parent = table.parentNode
    parent.insertBefore(div, table)

    div.append(table)
})