# Example Queries

Get list of authors (_it will return only first 10 authors!_):

```graphql
query {
  authors {
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
```

Filter authors based of first name, also return total number of such authors:

```graphql
query {
  authors(firstName: "Robert") {
    totalCount
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
```

Order authors by first name and last name:

```graphql
query {
  authors(
    orderBy: [
      { field: FIRST_NAME, direction: ASC }
      { field: LAST_NAME, direction: ASC }
    ]
  ) {
    edges {
      cursor
      node {
        _id
        firstName
        lastName
      }
    }
  }
}
```

Get name of author with ID = 4:

```GraphQL
query {
  author(id: 4) {
    id
    _id
    firstName
    lastName
  }
}
```

Get list of quotes:

```GraphQL
query {
  quotes {
    edges {
      node {
        id
        _id
        quote
      }
    }
  }
}
```

Create new author:

```GraphQL
mutation {
  createAuthor(input:{
    firstName:"Kent"
    lastName:"Beck"
  }) {
    id
    _id
    firstName
    lastName
  }
}
```

Update existing author:

```GraphQL
mutation {
  updateAuthor(input:{
    id: 1
    firstName: "JOHN"
    lastName: "JOHNSON"
  }) {
    id
    _id
    firstName
    lastName
  }
}
```
