<?php

if(!class_exists('Weekdaycall')){
    class Weekdaycall {

        const EMAIL = 'ulin.evgeny.work@gmail.com';
    
        static protected function sendMail($message) {
            $result = mail(self::EMAIL, 'Ошибка в сниппете ' . __CLASS__, $message);
            return $result;
        }
    
        static public function isDayOff() {
            // Текущий год
            $year = date("Y");
    
            // Проверяем файл
            $calendarFolder = __DIR__ . '/calendars/';
            $calendarFile = $calendarFolder . $year . '.txt';
    
            if (!is_dir($calendarFolder)) {
                mkdir($calendarFolder, 0777, true);
            }
    
            if (!file_exists($calendarFile)) {
                // Файл не существует, его нужно скачать
                // Скачиваем данные
                $uri = 'https://isdayoff.ru/api/getdata?year=' . $year;
                ini_set('user_agent', 'Mozilla / 5.0 (Windows NT 10.0; Win64; x64) AppleWebKit / 537.36 (KHTML, like Gecko) Chrome / 105.0.0.0 Safari / 537.36');
                $contextOptions = ["ssl" => ["verify_peer" => false, "verify_peer_name" => false, 'allow_self_signed' => true]];
                $downloadedData = file_get_contents($uri, false, stream_context_create($contextOptions));
                if ($downloadedData === false) {
                    $text = 'Возникла ошибка при попытке скачать данные по ссылке: ' . $uri;
                    $lastError = error_get_last();
                    $headers = get_headers($uri, 1);
                    if (!empty($headers[0])) {
                        $code = str_replace('HTTP / 1.1 ', '', $headers[0]);
                        $text .= ', вот код ответа: ' . $code;
                    }
                    if (!empty($lastError)) {
                        $text .= ', вот дамп ошибки: ' . print_r($lastError, true);
                    }
    
                    self::sendMail($text);
                    return false;
                }
    
                // Сохраняем данные в файл
                $savedFile = file_put_contents($calendarFile, $downloadedData);
                if ($savedFile === false) {
                    $text = 'Возникла ошибка при попытке сохранить данные в файл';
                    $lastError = error_get_last();
                    if (!empty($lastError)) {
                        $text .= ', вот dump последней ошибки: ' . print_r($lastError, true);
                    }
                    self::sendMail($text);
                    return false;
                }
            }
    
            // Читаем данные из файла (если их еще нет)
            if (empty($downloadedData)) {
                $downloadedData = file_get_contents($calendarFile);
            }
    
            // Преобразуем данные в массив
            $downloadedData = str_split($downloadedData);
    
            // Смотрим элемент массива с нужным индеком
            $val = $downloadedData[localtime()[7]];
            if ($val !== '1' && $val !== '0') {
                $text = "Возникла ошибка при проверке дня $val на нерабочий";
                self::sendMail($text);
                return false;
            }
    
            return $val;
        }
    
    }
}

$modx->setPlaceholder('weekdaycall', Weekdaycall::isDayOff());
