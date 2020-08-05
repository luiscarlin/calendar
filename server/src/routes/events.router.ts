import { Router } from 'express';

let eventsRouter = Router();

eventsRouter.get('/', async (req, res) => {
  console.log('hello');
  return res.send({ hello: 'events' });
});

export { eventsRouter };
