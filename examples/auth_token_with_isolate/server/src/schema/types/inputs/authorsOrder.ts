import { GraphQLInputObjectType, GraphQLNonNull } from "graphql";
import authorsOrderField from "../enums/authorsOrderField";
import direction from "../enums/direction";

const authorsOrder = new GraphQLInputObjectType({
  name: "AuthorsOrder",
  fields: {
    field: {
      type: new GraphQLNonNull(authorsOrderField),
    },
    direction: {
      type: new GraphQLNonNull(direction),
    },
  },
});

export default authorsOrder;
