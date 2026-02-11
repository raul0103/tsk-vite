export default class CookieManager {
    constructor(cname = null) {
        this.cname = cname
    }

    get(cname = this.cname) {
        let name = cname + "=";
        let decodedCookie = decodeURIComponent(document.cookie);
        let ca = decodedCookie.split(';');
        for (let i = 0; i < ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }

    set(cvalue, cname = this.cname) {
        document.cookie = cname + "=" + cvalue + ";";
    }

    delete(cname = this.cname) {
        if (cname) {
            document.cookie = cname + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
        }
    }
}