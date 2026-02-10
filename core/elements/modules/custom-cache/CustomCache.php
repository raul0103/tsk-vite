<?php

class CustomCache
{
    private $mainfolder = MODX_CORE_PATH . '/custom-cache/'; // Основная папка кэша
    private $cachefolder; // Подпапки, передаются при инициализации класса

    /**
     * $path - Путь к файлу кэша, включающий название папки и файла
     */
    public function __construct($cachefolder)
    {
        $this->cachefolder = $cachefolder . '/';
    }

    public function set($filename, $data)
    {
        // Создание директорий, если они не существуют
        $folder = $this->mainfolder . $this->cachefolder;
        if (!file_exists($folder)) {
            mkdir($folder, 0755, true);
        }

        $data = '<?php return ' . var_export($data, true) . ';';
        file_put_contents($this->mainfolder . $this->cachefolder . $filename . '.php', $data, LOCK_EX);
    }

    public function get($filename)
    {
        $file = $this->mainfolder . $this->cachefolder . $filename . '.php';
        if (file_exists($file)) {
            return include $file;
        } else {
            return null;
        }
    }
}
