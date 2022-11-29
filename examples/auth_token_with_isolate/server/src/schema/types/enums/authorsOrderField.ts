import { GraphQLEnumType } from "graphql";

export default new GraphQLEnumType({
  name: "AuthorsOrderField",
  values: {
    ID: {
      value: "id",
    },
    FIRST_NAME: {
      value: "firstName",
    },
    LAST_NAME: {
      value: "lastName",
    },
    CREATED_AT: {
      value: "createdAt",
    },
  },
});
