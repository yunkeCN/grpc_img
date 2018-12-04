GRPC Node 依赖包预安装镜像
=============================

## 构建镜像

```sh
docker build -t grpc:v1.0.0 .
```

备注：

npm 安装 grpc-node 优先通过下载二进制包安装 grpc.node。
如果下载失败，则会转向 gyp 编译，因容器内不存在 python 等必须的工具，编译必然失败。
总之，上述过程有一定概率失败，此镜像在正式使用前，建议通过人工验证其可用性。

## 试用镜像

```sh
# 启动空镜像
docker run --rm -it grpc:v1.0.0 sh
# 挂载外部应用 - 启动一个 grpc 服务器
docker run \
  --name grpc-test \
  -v $(pwd)/demo:/home/node/app \
  -p 8000:8000 \
  -d \
  grpc:v1.0.0 \
  npm run run
# 尝试连接 - 启动一个 grpc 客户端
node demo/client.js
```