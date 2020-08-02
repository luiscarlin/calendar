import express from "express";
import { sequelize } from "./db";

require("dotenv").config();

const app = express();
const { SERVER_PORT } = process.env;

// app.use(express.json());
app.listen(SERVER_PORT, () =>
  sequelize
    .authenticate()
    .then(() => console.log(`Server and DB running at port ${SERVER_PORT}`))
    .catch((err) => console.log("Connection Failed", err))
);
