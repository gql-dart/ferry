import { GraphQLNonNull, GraphQLObjectType, GraphQLString } from "graphql";

const jwtToken = new GraphQLObjectType({
  name: "jwtToken",
  fields: () => ({
    token: {
      type: new GraphQLNonNull(GraphQLString),
      description: "jwtToken",
    },
  }),
});

export default jwtToken;
