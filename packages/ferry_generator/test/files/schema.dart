const schema = r'''
enum Platform {
  ios
  android
}

type User {
  id: ID!
  username: String!
}

input NewUser {
  username: String!
  password: String!
  email: String!
}

input SignInUser {
  username: String!
  password: String!
  platform: Platform!
}

type Query {
  signin(user: SignInUser!): String!
}

type Mutation {
  signup(user: NewUser!): ID!
}
''';

const query = r'''
query SignIn($user: SignInUser!) {
  signin(user: $user)
}
''';

const mutation = r'''
mutation SignUp($user: NewUser!) {
  signup(user: $user)
}
''';
