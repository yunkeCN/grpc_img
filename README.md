GRPC Node 依赖包预安装镜像
=============================

## 构建镜像

```sh
docker build -t grpc:v1.0.0 .
```

## 试用镜像

```sh
# 启动空镜像
docker run --rm -it grpc:v1.0.0 sh
# 挂在外部
docker run \
  --name grpc-test \
  -v $(pwd)/demo:/home/node/app \
  -p 8000:8000 \
  -d \
  grpc:v1.0.0 \
  npm run run
```