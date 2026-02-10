<?php
switch ($val) {
    case 'phone':
        if (!empty($_SESSION["+phone_cc"])) {
            return $_SESSION["+phone_cc"];
        }
        break;
    case 'email':
        if (!empty($_SESSION["+email_cc"])) {
            return $_SESSION["+email_cc"];
        }
        break;
    case 'source':
        if (!empty($_SESSION["+source_cc"])) {
            return $_SESSION["+source_cc"];
        }
        break;
    case 'city':
        $res = [];

        if (!empty($_SESSION["+icase_cc"])) {
            $res['icase'] = $_SESSION["+icase_cc"];
        }
        if (!empty($_SESSION["+pcase_cc"])) {
            $res['pcase'] = $_SESSION["+pcase_cc"];
        }
        if (!empty($_SESSION["+dcase_cc"])) {
            $res['dcase'] = $_SESSION["+dcase_cc"];
        }
        if (!empty($_SESSION["+rcase_cc"])) {
            $res['rcase'] = $_SESSION["+rcase_cc"];
        }
        if (!empty($_SESSION["+address_cc"])) {
            $res['address'] = $_SESSION["+address_cc"];
        }

        if (empty($res)) {
            return false;
        }

        return $res;

        break;
}
