export default function mailChange () {
    let links = document.querySelectorAll('a[href*="mailto"]');

    links.forEach(n => {
        n.innerText = n.innerText.replaceAll('mail@' + document.location.host, 'tsk@' + document.location.host);
        n.href = n.href.replaceAll('mail@' + document.location.host, 'tsk@' + document.location.host);
    })

}