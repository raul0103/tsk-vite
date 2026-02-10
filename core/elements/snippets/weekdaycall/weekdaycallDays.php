<?php

$days = [ 1 => "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"];

$result = [];
for ($i = 0; $i <= 5; $i++) {
    $dt = new DateTime("+$i day");
    $date = $dt->format('d.m');

    if ($i == 0) {
        $dayOfWeek = 'Сегодня';
    } else {
        $dayOfWeek = $days[$dt->format('N')];
    }

    $result[] = $dayOfWeek . " $date";
}

return $result;
