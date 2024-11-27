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
use App\Middleware\BaseMiddleware;
use App\Middleware\CorsMiddleware;
use App\Middleware\Sys\RequestMiddleware;
use Hyperf\Validation\Middleware\ValidationMiddleware;

/*
 * This file is part of Hyperf.
 *
 * @link     https://www.hyperf.io
 * @document https://hyperf.wiki
 * @contact  group@hyperf.io
 * @license  https://github.com/hyperf/hyperf/blob/master/LICENSE
 */
return [
    'http' => [
        // Hyperf\SwooleTracker\Middleware\HookMallocMiddleware::class,
        // Hyperf\SwooleTracker\Middleware\HttpServerMiddleware::class,

        RequestMiddleware::class,
        CorsMiddleware::class,
        BaseMiddleware::class,
        // App\Middleware\AuthMiddleware::class,
        ValidationMiddleware::class,
        // Hyperf\Validation\Middleware\ValidationMiddleware::class,
    ],
];
