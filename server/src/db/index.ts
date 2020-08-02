import { Sequelize } from "sequelize-typescript";
require("dotenv").config();

const { DB_NAME, DB_USER, DB_PASSWORD, DB_HOST } = process.env;

const sequelize = new Sequelize({
  database: DB_NAME,
  username: DB_USER,
  password: DB_PASSWORD,
  host: DB_HOST,
  port: 5000,
  models: [__dirname + "/models"],
  dialect: "postgres",
  protocol: "postgres",
});

export { sequelize };
