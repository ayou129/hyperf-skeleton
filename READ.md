## 基本使用
~~~bash
composer install -o

# 格式化代码
composer cs-fix

# 重新生成 Composer 的自动加载器文件 并且 优化自动加载器的性能
composer dump-auto -o

# 启动服务
php bin/hyperf.php start

# 开启debug
~~~


## 单元测试
~~~bash
# 单元测试用的 pestphp/pest

# 创建测试文件
php bin/hyperf.php gen:test BaseTest

# 运行测试
composer test



~~~