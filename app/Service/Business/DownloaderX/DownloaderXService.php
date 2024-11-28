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

namespace App\Service\Business\DownloaderX;

use Hyperf\Di\Annotation\Inject;
use Psr\EventDispatcher\EventDispatcherInterface;

class DownloaderXService
{
    private string $hidden_root_path = '/U盘文件APP分享/single/';

    private string $access_token = '126.f07f4afcf1e97bbef5ed79e8640d8c9a.YQ8crtFTkPokhd7tXaqJc42GkzLBFVzFNawtQx-.EktNkw';
    // #[Inject]
    // private EventDispatcherInterface $eventDispatcher;

    public function fileslist()
    {
        $params = [];

        // method参数，本接口固定为list，必填
        $params['method'] = 'list';

        // 起始位置，从0开始
        $params['start'] = 0;

        // dir参数，需要list的目录，以/开头的绝对路径，默认为/，路径包含中文时需UrlEncode编码，可选
        $params['dir'] = $this->hidden_root_path . '';

        // order参数，排序字段，默认为name；time按修改时间排序；name表示按文件名称排序；size表示按文件大小排序，可选
        $params['order'] = 'name';

        // desc参数，默认为升序，设置为1实现降序，可选
        $params['desc'] = 1;

        // start参数，起始位置，从0开始，可选
        $params['start'] = 0;

        // limit参数，查询数目，默认为1000，建议最大不超过1000，可选
        $params['limit'] = 1000;

        // web参数，值为1时，返回dir_empty属性和缩略图数据，可选
        $params['web'] = 0;

        // folder参数，是否只返回文件夹，0返回所有，1只返回文件夹，且属性只返回path字段，可选
        $params['folder'] = 0;

        // showempty参数，是否返回dir_empty属性，0不返回，1返回，可选
        $params['showempty'] = 0;

        return $this->getRequest($params);
    }

    private function getRequest($params)
    {
        $targetUrl = 'https://pan.baidu.com//rest/2.0/xpan/file?method=list&access_token=' . $this->access_token; // 替换为实际的请求 URL

        // 将参数拼接成 URL 查询字符串
        $queryString = http_build_query($params);

        // 如果 URL 中已经有查询参数，使用 & 连接新的参数
        if (strpos($targetUrl, '?') !== false) {
            $targetUrl .= '&' . $queryString;
        } else {
            $targetUrl .= '?' . $queryString;
        }

        // 设置请求头
        $headers = [
            'Content-Type: application/json; charset=UTF-8',
        ];

        // 初始化 cURL
        $ch = curl_init();

        // 设置请求选项
        curl_setopt($ch, CURLOPT_URL, $targetUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);

        // 设置固定的 host
        curl_setopt($ch, CURLOPT_RESOLVE, ['openapi.baidu.com:443:127.0.0.1']);

        // 执行请求
        $response = curl_exec($ch);

        // 检查是否有错误
        if (curl_errno($ch)) {
            echo 'cURL Error: ' . curl_error($ch);
        } else {
            echo $response;
            $response = json_decode($response, true);
        }

        // 关闭 cURL
        curl_close($ch);

        return $response;
    }
}
