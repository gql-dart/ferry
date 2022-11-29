import { GraphQLInputObjectType, GraphQLNonNull, GraphQLString } from "graphql";

const newAuthor = new GraphQLInputObjectType({
  name: "NewAuthor",
  fields: {
    firstName: {
      type: new GraphQLNonNull(GraphQLString),
    },
    lastName: {
      type: new GraphQLNonNull(GraphQLString),
    },
  },
});

export default newAuthor;
