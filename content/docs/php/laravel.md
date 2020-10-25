---
title: "Laravel 框架笔记"
---

## 创建一个 Larvel 项目
```shell
composer create-porject laravel/laravel --prefer-dist ./your_porject_name
composer create-porject laravel/laravel=5.4.* --prefer-dist ./your_porject_name
```

## 重要目录结构
|目录名|作用|
|---|---|
|app|保存模型文件（默认地址）|
|app/Http/Controllers|控制器文件|
|resources/views|视图文件|
|config|配置文件|
|routes|路由文件|
|databases/migrations|存放数据库迁移文件（操作数据库表结构）|
|databases/seeds|存放数据库种子文件（模拟测试数据）|

## 启动方式
```shell
php artsian server
```