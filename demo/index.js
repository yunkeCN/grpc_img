const http = require('http');

const PORT = 8000

http.createServer((req, res) => {
  console.log(req);
  res.end('Not Found');
}).listen(PORT, () => {
  console.log(`服务启动：${PORT}`);
});