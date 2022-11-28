import request from "supertest";
import express from "express";
import graphqlHTTP from "express-graphql";
import context from "../context";
import schema from "../schema";
import database from "../database";

afterAll(() => {
  return database.destroy();
});

test("Authors query", async () => {
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
      authors(first: 3) {
        edges {
          node {
            id
            _id
            firstName
            lastName
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
      authors: {
        edges: [
          {
            node: {
              id: "YXV0aG9yLTE=",
              _id: "1",
              firstName: "John",
              lastName: "Johnson",
            },
          },
          {
            node: {
              id: "YXV0aG9yLTI=",
              _id: "2",
              firstName: "Martin",
              lastName: "Fowler",
            },
          },
          {
            node: {
              id: "YXV0aG9yLTM=",
              _id: "3",
              firstName: "Jason",
              lastName: "Lengstorf",
            },
          },
        ],
      },
    },
  });
});

test("Authors query with order by argument", async () => {
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
      authors(first: 3, orderBy:[{ field: ID, direction: DESC }]) {
        edges {
          node {
            id
            _id
            firstName
            lastName
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
      authors: {
        edges: [
          {
            node: {
              id: "YXV0aG9yLTk=",
              _id: "9",
              firstName: "Jamie",
              lastName: "Zawinski",
            },
          },
          {
            node: {
              id: "YXV0aG9yLTg=",
              _id: "8",
              firstName: "Niels",
              lastName: "Bohr",
            },
          },
          {
            node: {
              id: "YXV0aG9yLTc=",
              _id: "7",
              firstName: "Felipe",
              lastName: "Fortes",
            },
          },
        ],
      },
    },
  });
});

test("Authors query with filter by first name and last name", async () => {
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
      authors(firstName:"j", lastName:"jo") {
        edges {
          node {
            id
            _id
            firstName
            lastName
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
      authors: {
        edges: [
          {
            node: {
              id: "YXV0aG9yLTE=",
              _id: "1",
              firstName: "John",
              lastName: "Johnson",
            },
          },
        ],
      },
    },
  });
});
