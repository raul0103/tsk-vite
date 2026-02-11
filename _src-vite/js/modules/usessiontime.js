// Выводит время сессии пользователя в секундах

import Cookies from 'js-cookie';

export default function get() {
    let unixDateNow = Cookies.get('usessiontime');
    let result;

    if (unixDateNow == null) {
        unixDateNow = Math.floor(Date.now() / 1000);
        Cookies.set('usessiontime', unixDateNow, {expires: 365});
        result = 0;
    } else {
        result = Math.floor(Date.now() / 1000) - unixDateNow;
    }

    return result;
}
