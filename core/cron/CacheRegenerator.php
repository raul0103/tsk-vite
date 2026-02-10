<?php

class CacheRegenerator
{
    /**
     * Было замечено, что в MODX для каждого посещения создается запись в таблице с сессиями. Если проходить все страницы всей сетки каждую ночь, то таблица с сессиями быстро станет ОЧЕНЬ БОЛЬШОЙ. Чтобы этого избежать, задаем свой User Agent, а в классе-обработчике сессий (session_handler_class) игнорируем посещения с таким User Agent.
     */
    protected const USER_AGENT = 'cacheRegenerator';

    protected $parts = 1;
    protected $currentPart = 1;

    public function __construct()
    {
        global $argv;

        unset($argv[0]);

        foreach ($argv as $arg) {
            $arg = explode('=', $arg);

            if (count($arg) != 2) {
                continue;
            }

            if ($arg[0] == 'part') {
                $part = explode('/', $arg[1]);

                if (count($part) == 2) {
                    $this->parts = intval(floor($part[1]));
                    $this->currentPart = intval(floor($part[0]));
                }

                if ($this->currentPart > $this->parts) {
                    $this->currentPart = intval(floor($this->parts));
                }

                if ($this->currentPart <= 0) {
                    $this->currentPart = 1;
                }
            }
        }
    }

    public function start()
    {
        // Включаем вывод ошибок
        ini_set('display_errors', '1');
        ini_set('display_startup_errors', '1');
        error_reporting(E_ALL);

        // Устанавливаем кодировку
        header('Content-Type: text/html; charset=utf-8');

        // Подключаем MODX
        $this->includeModx();

        // Запускаем скрипт
        $this->crawl();
    }

    public function includeModx()
    {
        global $modx;

        // Подключаем MODX
        define('MODX_API_MODE', true);
        $parentDir = dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR;
        $indexPhp = $parentDir . 'index.php';
        $i = 0;
        while (!file_exists($indexPhp) && $i < 9) {
            $parentDir = dirname(dirname($indexPhp)) . '/';
            $indexPhp = $parentDir . 'index.php';
            $i++;
        }
        if (file_exists($indexPhp)) {
            require_once $indexPhp;
        }
        if (!is_object($modx)) {
            exit('Ошибка при попытке подгрузить MODX');
        }
    }

    public function crawl()
    {
        global $modx;

        // Получаем все сайты
        $sql = "SELECT `value`
          FROM modx_context_setting                                            
          WHERE `key` = 'base_url' AND `context_key` != 'mgr' AND `value` != ''";

        $sites = $modx->query($sql);
        $sites = $sites->fetchAll(PDO::FETCH_COLUMN);

        ini_set('user_agent', static::USER_AGENT);

        // Проходимся по всем сайтам и достаем ссылки из sitemap.xml
        $urls = [];
        foreach ($sites as $site) {
            $sitemap = file_get_contents($site . 'sitemap.xml');
            preg_match_all('/<loc>(.*)<\/loc>/', $sitemap, $matches);

            if (empty($matches) || empty($matches[1])) {
                continue;
            }

            $urls = array_merge($urls, $matches[1]);
        }

        $startTime = hrtime(true);

        $countUrlsTotal = count($urls);
        $rowsInGroup = floor($countUrlsTotal / $this->parts);
        $from = ($this->currentPart - 1) * $rowsInGroup;

        if ($this->currentPart == $this->parts) {
            $urls = array_slice($urls, $from);
        } else {
            $urls = array_slice($urls, $from, $rowsInGroup);
        }

        $countUrlsHandle = count($urls);

        fwrite(STDOUT, "Начало работы. Часть " . $this->currentPart . "/" . $this->parts . ". Всего ссылок: $countUrlsTotal. Будет пройден промежуток: с $from по " . ($from + $countUrlsHandle) . "\n");

        foreach ($urls as $url) {
            // Вместо file_get_contents используем wget с 20-ю попытками. Иногда при посещении страницы падает 504 ошибка. И не один раз. Именно для этого 20 попыток
            exec(sprintf('wget  --tries=20 -U "' . static::USER_AGENT . '" -O /dev/null "%s"', $url));

            /*
            file_get_contents($url);
            
            $headers = get_headers($url, 1);
            
            $message = "[" . date('d.m.y G:i:s') . "] Произошел обход страницы: " . $url;
            if (!empty($headers[0])) {
                $message .=  ", ответ: " . $headers[0];
            }
            $message .= "\n";
            
            fwrite(STDOUT, $message);
            */
        }

        $wastedTime = (hrtime(true) - $startTime) / 1000000000;

        fwrite(STDOUT, "Часть " . $this->currentPart . "/" . $this->parts . ". Обработано ссылок: $countUrlsHandle. Затрачено времени: $wastedTime секунд\n");
    }
}

$cacheRegenerator = new CacheRegenerator();
$cacheRegenerator->start();