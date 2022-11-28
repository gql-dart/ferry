import { knex } from "knex";
import config from "./config";

const database = knex({
  client: "mysql2",
  ...config.database,
  pool: { min: 0, max: 7 },
});

export default database;
