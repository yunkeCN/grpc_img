const grpc = require('grpc');

const proto = grpc.load(__dirname + '/demo.proto').demo;

const address = '0.0.0.0:8000';

function main() {
  const server = new grpc.Server();
  const cred = grpc.ServerCredentials.createInsecure();
  server.addService(proto.Demo.service, {
    echo: function({request: req}, cb) {
      console.log(`收到数据：${req.text}`);
      cb(null, {text: req.text});
    }
  });
  server.bind(address, cred);
  server.start();
  console.log(`服务启动：${address}`);
}

main();