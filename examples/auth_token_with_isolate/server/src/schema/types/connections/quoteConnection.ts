import {
  GraphQLInt,
  GraphQLList,
  GraphQLNonNull,
  GraphQLObjectType,
} from "graphql";
import pageInfo from "../pageInfo";
import quoteEdge from "../edges/quoteEdge";

const quoteConnection = new GraphQLObjectType({
  name: "QuoteConnection",
  fields: {
    totalCount: {
      description: "Identifies the total count of items in the connection.",
      type: new GraphQLNonNull(GraphQLInt),
    },
    edges: {
      description: "A list of edges.",
      type: new GraphQLList(quoteEdge),
    },
    pageInfo: {
      type: new GraphQLNonNull(pageInfo),
    },
  },
});

export default quoteConnection;
