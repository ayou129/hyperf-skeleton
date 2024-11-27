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
use App\Constant\ServiceCode;
use App\Exception\ServiceException;
use App\Model\Admin;
use App\Model\User;
use Hyperf\Utils\ApplicationContext;
use HyperfExt\Jwt\Jwt;

if (! function_exists('di')) {
    function di($id = null)
    {
        $container = ApplicationContext::getContainer();
        if ($id) {
            return $container->get($id);
        }
        return $container;
    }
}

/*
 * 获取 jwt 中存储在 sub 的 user_id
 */
if (! function_exists('getLoginModel')) {
    function getLoginModel($type = 'user')
    {
        $jwt = di(Jwt::class);
        $id = $jwt->getClaim('sub') ?? false;
        if (is_numeric($id)) {
            switch ($type) {
                case 'user':
                    return User::findFromCache($id)
                        ->first();
                default:
                    return Admin::findFromCache($id)
                        ->first();
            }
        }
        throw new ServiceException(ServiceCode::ERROR_USER_NOT_EXISTS);
    }
}
/*
 * 正常情况：多语言不传参数
 * 异常情况：可能会传递参数
 */
if (! function_exists('filter')) {
    function filter(&$array)
    {
        // if ($array === []) {
        //     return new stdClass();
        // }
        foreach ($array as &$value) {
            if (is_array($value)) {
                $value = filter($value);
            }
            // if ($value === []) {
            //     $value = new stdClass();
            // }
            if ($value === null) {
                $value = '';
            }
        }
        return $array;
    }
}
