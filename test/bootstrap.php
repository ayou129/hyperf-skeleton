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
use Hyperf\Contract\ApplicationInterface;
use Hyperf\Di\ClassLoader;
use Hyperf\Engine\DefaultOption;
use Swoole\Coroutine;

ini_set('display_errors', 'on');
ini_set('display_startup_errors', 'on');

error_reporting(E_ALL);
date_default_timezone_set('Asia/Shanghai');

! defined('BASE_PATH') && define('BASE_PATH', dirname(__DIR__, 1));

require BASE_PATH . '/vendor/autoload.php';

// 定义协程钩子标志，排除一些不兼容的函数
if (defined('SWOOLE_HOOK_ALL')) {
    // 排除 proc_open 相关的钩子，因为它在测试环境中可能会导致问题
    $hookFlags = SWOOLE_HOOK_ALL & ~SWOOLE_HOOK_PROC;
    ! defined('SWOOLE_HOOK_FLAGS') && define('SWOOLE_HOOK_FLAGS', $hookFlags);
} else {
    ! defined('SWOOLE_HOOK_FLAGS') && define('SWOOLE_HOOK_FLAGS', DefaultOption::hookFlags());
}

// 启用协程环境
Swoole\Runtime::enableCoroutine(SWOOLE_HOOK_FLAGS);

// 确保测试在协程中运行
Coroutine::set(['hook_flags' => SWOOLE_HOOK_FLAGS]);

ClassLoader::init();

$container = require BASE_PATH . '/config/container.php';

$container->get(ApplicationInterface::class);
