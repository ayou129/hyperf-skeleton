<?php

declare(strict_types=1);

// namespace App\Controller;
namespace App\Controller\V1\Business\DownloaderX;

use Hyperf\HttpServer\Contract\RequestInterface;
use Hyperf\HttpServer\Contract\ResponseInterface;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\RequestMapping;

#[Controller(prefix: "/api/v1/downloaderx")]
class DownloaderXController
{
    #[RequestMapping(path: "fileslist", methods: "get")]
    public function fileslist(){
        return [];
    }

    #[RequestMapping(path: "filesdownloadurl", methods: "get")]
    public function filesdownloadurl(){
        return [];
    }
}
