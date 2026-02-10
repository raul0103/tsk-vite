<?php
// Удаление HTML-тегов и специальных символов
$text = strip_tags($content);

// Расчет времени чтения в минутах
$readingTimeMinutes = ceil(mb_strlen($text, 'utf-8') / 0.8 / 1275);

// Вывод времени чтения
return $readingTimeMinutes;
