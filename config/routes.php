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
use App\Controller\BaseController;
use App\Controller\TestController;
use App\Controller\V1\Admin\AdminController;
use App\Controller\V1\Admin\ConfigController;
use App\Controller\V1\Admin\DeptController;
use App\Controller\V1\Admin\DictController;
use App\Controller\V1\Admin\DictDetailController;
use App\Controller\V1\Admin\JobController;
use App\Controller\V1\Admin\MenuController;
use App\Controller\V1\Admin\RequestController;
use App\Controller\V1\Admin\RequestLogController;
use App\Controller\V1\Admin\RoleController;
use App\Controller\V1\Admin\UserController;
use App\Middleware\AuthMiddleware;
use Hyperf\HttpServer\Router\Router;

// Router::addRoute(['GET', 'POST', 'HEAD'], '/', 'App\Controller\IndexController@index');

Router::get('/favicon.ico', function () {
    return '';
});
// Router::get('/', function () {
//     return 'not supported!';
// });
Router::get(
    '/',
    [
        BaseController::class,
        'index',
    ]
);
Router::addGroup(
    '/test',
    function () {
        Router::get('/exception', [
            TestController::class,
            'testException',
        ]);
    }
);

Router::addGroup(
    '/api/v1/admin',
    function () {
        Router::post('/auth/user/login', [
            AdminController::class,
            'authLogin',
        ]);
    }
);

Router::addGroup(
    '/api/v1/admin',
    function () {
        // ------------------------ Admin - Auth -------
        Router::delete('/auth/user/logout', [
            AdminController::class,
            'authLogout',
        ]);
        Router::get('/auth/user/permcode', [
            AdminController::class,
            'authPermcode',
        ]);
        Router::get('/auth/user/info', [
            AdminController::class,
            'authUserinfo',
        ]);
        Router::get('/auth/user/menus', [
            AdminController::class,
            'authUserMenus',
        ]);

        Router::post('/system/user', [
            AdminController::class,
            'postUser',
        ]);
        Router::put('/system/user', [
            AdminController::class,
            'putUser',
        ]);
        Router::delete('/system/user', [
            AdminController::class,
            'deleteUser',
        ]);

        Router::get('/system/user/list', [
            AdminController::class,
            'userList',
        ]);

        Router::get('/system/user/exist', [
            UserController::class,
            'exist',
        ]);

        Router::put('/system/user/update_password', [
            UserController::class,
            'updatePass',
        ]);

        // ------------------------ Menu -------
        Router::get('/system/menu/all', [
            MenuController::class,
            'all',
        ]);
        Router::get('/system/menu/list', [
            MenuController::class,
            'list',
        ]);
        Router::post('/system/menu', [
            MenuController::class,
            'create',
        ]);
        Router::delete('/system/menu', [
            MenuController::class,
            'delete',
        ]);
        Router::put('/system/menu', [
            MenuController::class,
            'put',
        ]);
        Router::get('/system/menu/build', [
            MenuController::class,
            'build',
        ]);
        Router::get('/system/menu/child', [
            MenuController::class,
            'child',
        ]);

        Router::get('/system/menu/lazy', [
            MenuController::class,
            'lazy',
        ]);

        // ------------------------ Role -------
        Router::get('/system/role/list', [
            RoleController::class,
            'list',
        ]);
        Router::put('/system/role', [
            RoleController::class,
            'put',
        ]);
        Router::post('/system/role', [
            RoleController::class,
            'post',
        ]);
        Router::delete('/system/role', [
            RoleController::class,
            'delete',
        ]);

        Router::get('/system/role/id/{id}', [
            RoleController::class,
            'getById',
        ]);
        Router::get('/system/role/level', [
            RoleController::class,
            'level',
        ]);
        Router::get('/system/role/all', [
            RoleController::class,
            'all',
        ]);

        Router::put('/system/role/menu', [
            RoleController::class,
            'putMenu',
        ]);

        // ------------------------ Request -------
        Router::get('/request/list', [
            RequestController::class,
            'list',
        ]);
        Router::delete('/request', [
            RequestController::class,
            'delete',
        ]);

        // ------------------------ User -------

        Router::get('/user/list', [
            UserController::class,
            'list',
        ]);
        Router::put('/user', [
            UserController::class,
            'put',
        ]);
        Router::post('/user', [
            UserController::class,
            'post',
        ]);
        Router::delete('/user', [
            UserController::class,
            'delete',
        ]);
        // Router::put('/system/user/updateEmail', [
        //     UserController::class,
        //     'updateEmail',
        // ]);

        // ------------------------ Dept -------
        Router::get('/system/dept/list', [
            DeptController::class,
            'list',
        ]);
        Router::get('/system/dept/all', [
            DeptController::class,
            'all',
        ]);
        Router::put('/system/dept', [
            DeptController::class,
            'put',
        ]);
        Router::post('/system/dept', [
            DeptController::class,
            'post',
        ]);
        Router::delete('/system/dept', [
            DeptController::class,
            'delete',
        ]);

        // ------------------------ Job -------
        Router::get('/job', [
            JobController::class,
            'list',
        ]);
        Router::put('/job', [
            JobController::class,
            'put',
        ]);
        Router::post('/job', [
            JobController::class,
            'create',
        ]);
        Router::delete('/job', [
            JobController::class,
            'delete',
        ]);

        // ------------------------ Dict -------
        Router::get('/dict', [
            DictController::class,
            'list',
        ]);
        Router::put('/dict', [
            DictController::class,
            'put',
        ]);
        Router::post('/dict', [
            DictController::class,
            'create',
        ]);
        Router::delete('/dict', [
            DictController::class,
            'delete',
        ]);

        // ------------------------ DictDetail -------
        Router::get('/dictDetail', [
            DictDetailController::class,
            'list',
        ]);
        Router::put('/dictDetail', [
            DictDetailController::class,
            'put',
        ]);
        Router::post('/dictDetail', [
            DictDetailController::class,
            'create',
        ]);
        Router::delete('/dictDetail', [
            DictDetailController::class,
            'delete',
        ]);

        // ------------------------ RequestLog -------
        Router::get('/request_log/list', [
            RequestLogController::class,
            'list',
        ]);

        // ------------------------ Config -------
        Router::get('/config/list', [
            ConfigController::class,
            'list',
        ]);
        Router::post('/config', [
            ConfigController::class,
            'create',
        ]);
        Router::put('/config', [
            ConfigController::class,
            'put',
        ]);
        Router::delete('/config', [
            ConfigController::class,
            'delete',
        ]);
    },
    ['middleware' => [AuthMiddleware::class]]
);

// ------------------------ Template -------
// Router::addGroup(
//     '/api/v1/admin/wuliu',
//     function () {
//         // ------------------------ SailSchedule -------
//         Router::get('/api/model/list', [
//             ModelController::class,
//             'list',
//         ]);
//         Router::post('/api/sail_schedule', [
//             ModelController::class,
//             'post',
//         ]);
//         Router::put('/api/sail_schedule', [
//             ModelController::class,
//             'put',
//         ]);
//         Router::delete('/api/sail_schedule', [
//             ModelController::class,
//             'delete',
//         ]);
//     },
//     // ['middleware' => [AuthMiddleware::class]]
// );
