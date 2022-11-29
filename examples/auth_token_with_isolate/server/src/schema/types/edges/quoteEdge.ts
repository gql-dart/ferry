import { GraphQLObjectType, GraphQLString } from "graphql";
import quote from "../quote";

const quoteEdge = new GraphQLObjectType({
  name: "QuoteEdge",
  description: "List of edges.",
  fields: {
    node: {
      description: "The item at the end of the edge.",
      type: quote,
    },
    cursor: {
      description: "A cursor for pagination.",
      type: GraphQLString,
    },
  },
});

export default quoteEdge;
