const grpc = require('grpc');

const proto = grpc.load(__dirname + '/demo.proto').demo;
const cred = grpc.credentials.createInsecure();
const client = new proto.Demo('localhost:8000', cred);

client.echo({text: 'Hello world!'}, function(err, response) {
  console.log(response);
});