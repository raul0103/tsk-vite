<? 
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = $_SERVER['REQUEST_URI'];
$segments = explode('/', trim($uri, '/'));

$get = end($segments);

if($get!=null){
    $pos = strpos($get, 'page=');
    if($pos > 0){
        $get = substr($get, $pos + 5);
    }
    $pos2 = strpos($get, '&');
    if($pos2 > 0){
        $get = substr($get, 0, $pos2-strlen($get));
    }
}

if(is_numeric($get)){
    return $get;
}else{
    return null;
}