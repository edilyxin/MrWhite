# 项目使用说明

## 准备

### 安装环境

1. [node.js](http://nodejs.org/)
2. [mongodb](http://www.mongodb.org/)
3. 安装express、gruntjs、bower
  > npm install -g express
  > npm install -g grunt-cli
  > npm install -g bower

### 初始化环境

进入工程目录下的webapp目录运行`npm install`和`bower install`分别加载node的依赖与js的依赖

### 运行

在工程目录下的webapp目录运行`grunt`启动express服务，由于配置了livereload所以所有的修改可不重启直接看效果。