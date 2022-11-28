import request from "supertest";
import express from "express";
import graphqlHTTP from "express-graphql";
import context from "../context";
import schema from "../schema";
import database from "../database";

afterAll(() => {
  return database.destroy();
});

test("Quotes query", async () => {
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
      quotes(first: 3) {
        edges {
          node {
            id
            _id
            text
            createdAt
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
      quotes: {
        edges: [
          {
            node: {
              id: "cXVvdGUtMQ==",
              _id: "1",
              text: "First, solve the problem. Then, write the code.",
              createdAt: "2020-07-02 12:43:00",
            },
          },
          {
            node: {
              id: "cXVvdGUtMg==",
              _id: "2",
              text: "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.",
              createdAt: "2020-07-02 12:43:01",
            },
          },
          {
            node: {
              id: "cXVvdGUtMw==",
              _id: "3",
              text: "If you stop learning, then the projects you work on are stuck in whatever time period you decided to settle.",
              createdAt: "2020-07-02 12:43:02",
            },
          },
        ],
      },
    },
  });
});

test("Quotes query with authors", async () => {
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
      quotes(first: 3) {
        edges {
          node {
            id
            _id
            text
            author {
              id
              _id
              firstName
              lastName
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
      quotes: {
        edges: [
          {
            node: {
              id: "cXVvdGUtMQ==",
              _id: "1",
              text: "First, solve the problem. Then, write the code.",
              author: {
                id: "YXV0aG9yLTE=",
                _id: "1",
                firstName: "John",
                lastName: "Johnson",
              },
            },
          },
          {
            node: {
              id: "cXVvdGUtMg==",
              _id: "2",
              text: "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.",
              author: {
                id: "YXV0aG9yLTI=",
                _id: "2",
                firstName: "Martin",
                lastName: "Fowler",
              },
            },
          },
          {
            node: {
              id: "cXVvdGUtMw==",
              _id: "3",
              text: "If you stop learning, then the projects you work on are stuck in whatever time period you decided to settle.",
              author: {
                id: "YXV0aG9yLTM=",
                _id: "3",
                firstName: "Jason",
                lastName: "Lengstorf",
              },
            },
          },
        ],
      },
    },
  });
});

test("Quotes query with filter", async () => {
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
      quotes(first: 3, query: "code") {
        edges {
          node {
            id
            _id
            text
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
      quotes: {
        edges: [
          {
            node: {
              id: "cXVvdGUtMQ==",
              _id: "1",
              text: "First, solve the problem. Then, write the code.",
            },
          },
          {
            node: {
              id: "cXVvdGUtMg==",
              _id: "2",
              text: "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.",
            },
          },
          {
            node: {
              id: "cXVvdGUtNA==",
              _id: "4",
              text: "Bad programmers worry about the code. Good programmers worry about the data structures and their relationships.",
            },
          },
        ],
      },
    },
  });
});
