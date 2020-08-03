import express from 'express';
import { dbClient } from './database/dbClient';

require('dotenv').config();

dbClient
  .connect()
  .then(() => console.log('connected'))
  .catch((err) => console.error('connection error', err.stack));

const app = express();
const { SERVER_PORT } = process.env;

app.listen(SERVER_PORT, () => console.log(`Listening on port ${SERVER_PORT}`));
