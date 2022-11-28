import { GraphQLInputObjectType, GraphQLNonNull, GraphQLString } from "graphql";

const loginInput = new GraphQLInputObjectType({
  name: "loginInput",
  fields: {
    username: {
      type: new GraphQLNonNull(GraphQLString),
    },
    password: {
      type: new GraphQLNonNull(GraphQLString),
    },
  },
});

export default loginInput;
