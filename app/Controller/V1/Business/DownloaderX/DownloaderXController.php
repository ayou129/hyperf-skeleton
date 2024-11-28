<?php

declare(strict_types=1);

// namespace App\Controller;
namespace App\Controller\V1\Business\DownloaderX;

use App\Service\Business\DownloaderX\DownloaderXService;
use Hyperf\HttpServer\Contract\RequestInterface;
use Hyperf\HttpServer\Contract\ResponseInterface;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\RequestMapping;
use App\Controller\AbstractController;
use Hyperf\Di\Annotation\Inject;

#[Controller(prefix: "/api/v1/downloaderx")]
class DownloaderXController extends AbstractController
{
    // 注解注入
    #[Inject]
    protected DownloaderXService $service;

    #[RequestMapping(path: "fileslist", methods: "get")]
    public function fileslist(){
        return $this->resJson($this->service->fileslist());
    }

    #[RequestMapping(path: "filesdownloadurl", methods: "get")]
    public function filesdownloadurl(){
        return [];
    }
}
