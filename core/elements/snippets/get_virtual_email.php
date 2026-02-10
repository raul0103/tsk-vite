<?

$email='';
$data = $modx->getPlaceholder('localdata');

$email=$data["main_contacts"]["email_prefix"]."@";

if(isset($data["main_contacts"]["email_suffix"])){
    $email=$email.$data["main_contacts"]["email_suffix"];
}else{
    $email=$email.$modx->getOption('http_host');
}

return $email;

?>