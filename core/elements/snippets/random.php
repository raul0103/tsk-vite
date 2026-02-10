<?php

if(!function_exists("generateRandomNumber"))
{
    function generateRandomNumber($id, $start, $end, $unique = 1): int
    {
        // Get the current date
        $currentDate = date('Ymd');

        // Concatenate the date and ID to generate a unique seed
        $seed = hexdec(substr(md5($currentDate . $id . $unique), 0, 8));

        // Seed the random number generator
        mt_srand($seed);

        // Generate a random number between 300 and 600
        return mt_rand($start, $end);
    }
}

if(empty($id)){
    return "Требуется id";
}

if(empty($start)){
    $start = 0;
}

if(empty($end)){
    $end = 0;
}

if(!empty($unique))
{
    return generateRandomNumber($id, $start, $end, $unique);
}else{
    return generateRandomNumber($id, $start, $end);
}
