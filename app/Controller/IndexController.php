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

namespace App\Controller;

use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\RequestMapping;

#[Controller]
class IndexController extends AbstractController
{
    #[RequestMapping(path: 'index', methods: 'get,post')]
    public function index()
    {
        // $user = $this->request->input('user', 'Hyperf');
        // $method = $this->request->getMethod();
        $a = 1;
        return [
            'method' => 1,
            'message' => 'Hello {1}.',
        ];
    }
}
