<?php
// Этот сниппет вызывается из содержимого MODX. Так что не надо его удалять, так как не получилось найти его вызов в коде

if (empty($params)) {
    return 'err5';
}

if (!class_exists('VideoLazyLoadRT')) {
    class VideoLazyLoadRT {

        static public function createLazyload($params) {
            $params = explode(',', $params);
            $paramsKV = [];
            foreach ($params as $param) {
                $paramKeyValue = explode('=', $param);
                $paramsKV[$paramKeyValue[0]] = $paramKeyValue[1];
            }

            if (!empty($paramsKV['src'])) {
                $src = $paramsKV['src'];
            } else {
                return 'err1';
            }

            $width = 0;
            $height = 0;
            if (!empty($paramsKV['w'])) {
                $width = intval($paramsKV['w']);
            }
            if (!empty($paramsKV['h'])) {
                $height = intval($paramsKV['h']);
            }

            $preview = self::getPreview($src);

            if (!empty($width)) {
                $width = ' data-width="' . $width . '"';
            }
            if (!empty($height)) {
                $height = ' data-height="' . $height . '"';
            }

            return '
            <div class="lazy-video"' . ($width ?: '') . ($height ?: '') . '>
              <a class="lazy-video__link" href="https://rutube.ru/video/' . $src . '">
                <img src="/assets/images/placeholder.png"
                     data-src="' . $preview . '"
                     class="lazy lazy-video__media" alt="">
              </a>
            </div>
        ';
        }

        static protected function downloadPreview($src) {
            $contextOptions = [
                "ssl" => [
                    "verify_peer" => false,
                    "verify_peer_name" => false,
                    'allow_self_signed' => true
                ],
            ];
            $uri = "https://rutube.ru/api/video/$src/thumbnail/?redirect=1";
            $downloadedFile = file_get_contents($uri, false, stream_context_create($contextOptions));

            return $downloadedFile;
        }

        static protected function getPreview($src) {
            $filename = $src . '.jpg';
            $partOfPath = 'images/videoLazyLoad/';
            $pathToFile = MODX_ASSETS_PATH . $partOfPath . $filename;
            $pathToFolder = MODX_ASSETS_PATH . $partOfPath;
            $uriToFile = MODX_ASSETS_URL . $partOfPath . $filename;

            if (file_exists($pathToFile)) {
                return $uriToFile;
            }

            if (!is_dir($pathToFolder)) {
                $result = mkdir($pathToFolder, 0777, true);
                if (!$result) {
                    return 'err2';
                }
            }

            $downloadedFile = static::downloadPreview($src);
            if ($downloadedFile === false) {
                return 'err3';
            }

            $savedFile = file_put_contents($pathToFile, $downloadedFile);
            if ($savedFile === false) {
                return 'err4';
            }

            return $uriToFile;
        }
    }
}

echo VideoLazyLoadRT::createLazyload($params);
