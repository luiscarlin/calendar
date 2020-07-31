import express from "express";

require("dotenv").config();

const app = express();
const { SERVER_PORT } = process.env;

app.use(express.json());
app.listen(SERVER_PORT, () => console.log(`Listening at port ${SERVER_PORT}`));
