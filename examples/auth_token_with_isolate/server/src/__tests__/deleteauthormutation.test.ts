import request from "supertest";
import express from "express";
import graphqlHTTP from "express-graphql";
import context from "../context";
import schema from "../schema";
import database from "../database";

afterAll(() => {
  return database.destroy();
});

test("deleteAuthor mutation", async () => {
  const app = express();

  app.use(
    "/graphql",
    graphqlHTTP({
      context,
      schema,
    })
  );

  const id = (
    await database
      .insert({ firstName: "firstTest", lastName: "lastTest" })
      .into("author")
  )[0];

  const query = `
    mutation {
      deleteAuthor(input: {
        id: ${id}
      }) {
        id
        _id
        firstName
        lastName
      }
    }
  `;

  const response = await request(app)
    .post("/graphql")
    .type("json")
    .send(JSON.stringify({ query }));

  expect(response.statusCode).toEqual(200);

  expect(JSON.parse(response.text)).toEqual({
    data: {
      deleteAuthor: {
        id: Buffer.from(`author-${id}`).toString("base64"),
        _id: `${id}`,
        firstName: "firstTest",
        lastName: "lastTest",
      },
    },
  });
});
