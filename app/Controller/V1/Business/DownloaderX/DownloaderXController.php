<?php

declare(strict_types=1);
/**
 * This file is part of Hyperf.
 *
 * @link     https://www.hyperf.io
 * @document https://hyperf.wiki
 * @contact  group@hyperf.io
 * @license  https://github.com/hyperf/hyperf/blob/master/LICENSE
 */

namespace App\Controller\V1\Business\DownloaderX;

use App\Controller\AbstractController;
use App\Service\Business\DownloaderX\DownloaderXService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\RequestMapping;

#[Controller(prefix: '/api/v1/downloaderx')]
class DownloaderXController extends AbstractController
{
    // 注解注入
    #[Inject]
    protected DownloaderXService $service;

    #[RequestMapping(path: 'fileslist', methods: 'get')]
    public function fileslist()
    {
        return $this->resJson($this->service->fileslist());
    }

    #[RequestMapping(path: 'filesdownloadurl', methods: 'get')]
    public function filesdownloadurl()
    {
        return [];
    }
}
