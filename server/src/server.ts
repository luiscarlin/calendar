import express from 'express';
import { eventsRouter } from './routes/events.router';
import { usersRouter } from './routes/users.router';

require('dotenv').config();

const app = express();
const { SERVER_PORT } = process.env;

app.use('/api/events', eventsRouter);
app.use('/api/users', usersRouter);

app.listen(SERVER_PORT, () => console.log(`Listening on port ${SERVER_PORT}`));
