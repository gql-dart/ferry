import request from "supertest";
import express from "express";
import graphqlHTTP from "express-graphql";
import context from "../context";
import schema from "../schema";
import database from "../database";

afterAll(() => {
  return database.destroy();
});

test("Author query", async () => {
  const app = express();

  app.use(
    "/graphql",
    graphqlHTTP({
      context,
      schema,
    })
  );

  const query = `
    query {
      author(id: 1) {
        id
        _id
        firstName
        lastName
        createdAt
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
      author: {
        id: "YXV0aG9yLTE=",
        _id: "1",
        firstName: "John",
        lastName: "Johnson",
        createdAt: "2020-07-02 11:06:01",
      },
    },
  });
});

test("Author query with quote", async () => {
  const app = express();

  app.use(
    "/graphql",
    graphqlHTTP({
      context,
      schema,
    })
  );

  const query = `
    query {
      author(id: 1) {
        id
        _id
        firstName
        lastName
        createdAt
        quotes(first: 1) {
          edges {
            node {
              id
              _id
              text
            }
          }
        }
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
      author: {
        id: "YXV0aG9yLTE=",
        _id: "1",
        firstName: "John",
        lastName: "Johnson",
        createdAt: "2020-07-02 11:06:01",
        quotes: {
          edges: [
            {
              node: {
                id: "cXVvdGUtMQ==",
                _id: "1",
                text: "First, solve the problem. Then, write the code.",
              },
            },
          ],
        },
      },
    },
  });
});
