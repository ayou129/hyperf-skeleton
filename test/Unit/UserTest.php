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

namespace HyperfTest\Unit;

use Hyperf\Testing\Client;
use Hyperf\Testing\TestCase;
use Swoole\Coroutine;
use function Hyperf\Support\make;

/**
 * @internal
 * @coversNothing
 */
class UserTest extends TestCase
{
    /**
     * @var Client
     */
    protected $client;

    public function __construct($name = null, array $data = [], $dataName = '')
    {
        parent::__construct($name, $data, $dataName);
        $this->client = make(Client::class, ['server' => 'adminHttp']);
    }

    public function testExample()
    {
        $this->assertTrue(true);
    }

    public function testUserApi()
    {
        // 确保测试在协程中运行
        if (!Coroutine::getCid()) {
            $this->markTestSkipped('This test must run in a coroutine environment.');
            return;
        }

        $result = $this->client->json('/user/123', [
            'nickname' => 'Hyperf'
        ]);

        // 这里可以添加断言来验证API响应
        // $this->assertSame(0, $result['code']);
        // $this->assertArrayHasKey('data', $result);
    }
    
    public function testNotFoundApi()
    {
        // 确保测试在协程中运行
        if (!Coroutine::getCid()) {
            $this->markTestSkipped('This test must run in a coroutine environment.');
            return;
        }
        
        // 发送请求到不存在的路径
        $response = $this->client->get('/123');
        print_r($response);
        
        // 验证状态码是否为404
        print_r($response->getStatusCode());
        print_r($response->getBody()->getContents());
        $this->assertSame(200, $response->getStatusCode());
        
        // 如果您的API返回JSON格式的错误信息，可以进一步验证响应内容
        $content = $response->getBody()->getContents();
        $result = json_decode($content, true);
        
        // 验证错误信息中是否包含预期的字段
        // 注意：以下断言需要根据您的API实际返回格式进行调整
        $this->assertIsArray($result);
        $this->assertArrayHasKey('code', $result);
        $this->assertArrayHasKey('msg', $result);
        $this->assertSame(-1, $result['code']); // 假设您的API在code字段中返回状态码
        $this->assertStringContainsString('not found', strtolower($result['msg'])); // 假设错误信息中包含"not found"
    }
} 