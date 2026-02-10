<?php

$dom = new DOMDocument;
$dom->encoding = 'UTF-8';
@$dom->loadHTML(mb_convert_encoding($scriptProperties['content'], 'HTML-ENTITIES', 'UTF-8'));

$xpath = new DOMXPath($dom);

/**
 * Задаем id для всех тегов h2
 * Необходимо для поиска элементов на след этапе
 */
$h2Elements = $xpath->query('//h2');

foreach ($h2Elements as $index => $h2) {
    $h2->setAttribute('id', 'h2-anchor-' . ($index + 1));
}

/**
 * Начинаем генерацию содержания
 */
$summary = '<ul class="article-content-list"><li class="article-content-list__title">Содержание статьи</li>'; // Содержание

foreach ($h2Elements as $h2_index => $h2) {
    $h2Id = $h2->getAttribute('id');
    $index_1= ($h2_index + 1);
    $summary .= '<li class="article-content-list__item"><span class="article-content-list__index">' . $index_1 . '</span><a href="#h2-anchor-' . ($index_1 + 1) . '" data-anchor-scroll>' . $h2->nodeValue . '</a>';

    // Находим следующий h2 относительно текущего h2
    $nextH2 = $xpath->query('following-sibling::h2', $h2)->item(0);

    // Проверяем, существует ли следующий h2
    if ($nextH2 !== null) {
        $nextH2Id = $nextH2->getAttribute('id');

        // Находим все элементы h3 между текущим h2 и следующим h2
        $h3Elements = $xpath->query("following-sibling::h3[preceding-sibling::h2[@id='$h2Id'] and following-sibling::h2[@id='$nextH2Id']]", $h2);
    } else {
        // Находим все элементы h3 после текущего h2
        $h3Elements = $xpath->query("following-sibling::h3[preceding-sibling::h2[@id='$h2Id'] and not(following-sibling::h2)]", $h2);
    }

    if (count($h3Elements) > 0) {
        $summary .= '<ul>';
        foreach ($h3Elements as $h3_index => $h3) {
            $id = 'h3-anchor-' .$index_1.'-'. ($h3_index + 1);
            $h3->setAttribute('id', $id);
            $summary .= '<li class="article-content-list__item"><span class="article-content-list__index">' . $index_1 . '.' . ($h3_index + 1) . '</span><a href="#' . $id . '" data-anchor-scroll>' . $h3->nodeValue . '</a></li>';
        }
        $summary .= '</ul>';
    }

    $summary .= '</li>';
}

$html = $dom->saveHTML();

$summary .= '</ul>';

return $summary . $html;
