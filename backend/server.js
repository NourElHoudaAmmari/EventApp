const jsonServer = require('json-server');
const server = jsonServer.create();
const router = jsonServer.router('db.json');
const middlewares = jsonServer.defaults();

server.use(middlewares);
server.use(jsonServer.bodyParser);

server.use((req, res, next) => {
  if (req.method === 'POST') {
    req.body.created = Date.now();
  }

  if (req.method === 'PUT') {
    req.body.updated = Date.now();
  }

  next();
});

server.use('/api', router);
server.listen(3004, () => {
  console.log('JSON Server is running');
});
