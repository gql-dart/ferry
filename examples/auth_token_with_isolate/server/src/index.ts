import express from "express";
import graphqlHTTP from "express-graphql";
import responseTime from "./middlewares/reponseTime";
import cors from "./middlewares/cors";
import config from "./config";
import context from "./context";
import schema from "./schema";
import database from "./database";

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(responseTime);
app.use(cors);

app.use(
  "/graphql",
  graphqlHTTP((req, res, gqlParams) => {
    return {
      context: context(req),
      graphiql: {
        defaultQuery: config.defaultQuery,
      } as undefined,
      schema,
    };
  })
);

async function start(): Promise<void> {
  try {
    // check database connection
    await database.raw("SELECT 1 + 1 AS result");

    if ("migrations" in config.database) {
      await database.migrate.latest({
        directory: config.database.migrations.directory,
      });
    }

    app.listen(config.port, () => {
      console.log(`Server started at http://localhost:${config.port}`);
    });
  } catch (error) {
    process.exit(1);
  }
}

start();
