import { GraphQLSchema } from "graphql";
import mutation from "./mutation";
import query from "./query";

export default new GraphQLSchema({
  mutation,
  query,
});
