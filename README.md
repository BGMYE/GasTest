# vue3-springboot2(升级3)-flowable

基于 Spring Boot 2 的快速开发框架，集成 Vue 3 和 Flowable 工作流引擎，前端界面经过美化优化。

## 项目特色

- ⚡ 基于 `springboot2` 构建，性能优异
- 🖼 集成 `vue3` 前端框架，用户体验佳
- 🔧 内置 `flowable` 工作流引擎，支持流程管理
- 💄 前端美化，现代化界面设计

## 技术栈

- 后端：Spring Boot 2.x、Flowable 6.x
- 前端：Vue 3.x、Element Plus
- 数据库：MySQL、MyBatis Plus


### 后端启动

1. **克隆项目**
   ```bash
   git clone https://gitee.com/heqy65552335/ruoyi-plus.git
   ```

2. **数据库配置**
   - 创建数据库 `ruoyi-plus`
   - 导入 `sql/ruoyi-flowable.sql` 文件

3. **修改配置**
   - 编辑 `ruoyi-admin/src/main/resources/application-druid.yml`
   - 配置 MySQL 和 Redis 连接信息

4. **启动应用**
   ```bash
   # 方式一：IDE 启动
   运行 ruoyi-admin/src/main/java/com/ruoyi/RuoYiApplication.java
   ```

### 前端启动

1. **安装依赖**
   ```bash
   npm install --registry=https://registry.npmmirror.com
   ```
   
2**访问系统**
   - 前端地址：http://localhost:80
   - 后端接口：http://localhost:8080
   - 默认账号：admin/admin123

## 📦 部署指南

### 生产环境部署

1. **后端部署**
   ```bash
   # 打包
   mvn clean package -Dmaven.test.skip=true
   
   # 部署
   java -jar ruoyi-admin.jar --spring.profiles.active=prod
   ```

2. **前端部署**
   ```bash
   # 构建
   npm run build:prod

   ```


## ⚠️ 注意事项

### 数据库相关

- **表结构要求**：新建表必须包含以下字段
  ```sql
  create_time   datetime     comment '创建时间',
  create_by     varchar(64)  comment '创建者',
  create_name   varchar(64)  comment '创建者姓名',
  update_time   datetime     comment '更新时间',
  update_by     varchar(64)  comment '更新者',
  update_name   varchar(64)  comment '更新者姓名'
  ```

- **软删除字段**：如果使用软删除，添加 `del_flag` 字段，代码生成器会自动处理

- **MySQL 配置**：需要在 `my.cnf` 中添加以下配置
  ```ini
  [mysqld]
  # 取消大小写敏感
  lower_case_table_names=1
  # 取消严格模式
  innodb_strict_mode=0
  ```

### 开发规范

- **代码组织**：新功能建议放在 `sxgpra` 模块下，便于代码管理和框架升级