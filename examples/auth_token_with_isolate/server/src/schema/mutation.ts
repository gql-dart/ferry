import { GraphQLObjectType } from "graphql";
import createAuthor from "./mutations/createAuthor";
import deleteAuthor from "./mutations/deleteAuthor";
import login from "./mutations/login";

const mutation = new GraphQLObjectType({
  name: "Mutation",
  fields: (): any => ({
    createAuthor,
    deleteAuthor,
    login,
  }),
});

export default mutation;
