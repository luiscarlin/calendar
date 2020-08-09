import { Router } from 'express';
import { getAllEventsController } from '../controllers/events.controller';

let eventsRouter = Router();

eventsRouter.get('/', async (req, res) => {
  const allEvents = await getAllEventsController();
  return res.send(allEvents);
});

export { eventsRouter };
