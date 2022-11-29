import {
  GraphQLID,
  GraphQLNonNull,
  GraphQLObjectType,
  GraphQLString,
  GraphQLInt,
} from "graphql";
import Context from "../../context/Context";
import { formatDate } from "../../utils/functions";
import quoteConnection from "./connections/quoteConnection";
import nodesToEdges from "../queries/nodesToEdges";
import toConnection from "../queries/toConnection";

const author = new GraphQLObjectType({
  name: "Author",
  fields: () => ({
    id: {
      type: new GraphQLNonNull(GraphQLID),
      description: "Globally unique ID of the author",
      resolve: (obj: Author): string => {
        return Buffer.from(`author-${obj.id}`).toString("base64");
      },
    },
    _id: {
      type: new GraphQLNonNull(GraphQLID),
      description: "Database ID of the author",
      resolve: (obj: Author): number => {
        return obj.id;
      },
    },
    firstName: {
      type: new GraphQLNonNull(GraphQLString),
      description: "Author's first name",
      resolve: (obj: Author): string => {
        return obj.firstName;
      },
    },
    lastName: {
      type: new GraphQLNonNull(GraphQLString),
      description: "Author's last name",
      resolve: (obj: Author): string => {
        return obj.lastName;
      },
    },
    quotes: {
      type: quoteConnection,
      args: {
        first: {
          defaultValue: 10,
          description:
            "Limits the number of results returned in the page. Defaults to 10.",
          type: GraphQLInt,
        },
        after: {
          defaultValue: "Y3Vyc29yMA==", // base64encode('cursor0')
          description:
            "The cursor value of an item returned in previous page. An alternative to in integer offset.",
          type: GraphQLString,
        },
        query: {
          type: GraphQLString,
        },
      },
      resolve: async (obj: Author, args, context: Context): Promise<any> => {
        const after =
          typeof args.after === "undefined" || args.after === null
            ? 0
            : parseInt(
                Buffer.from(args.after, "base64")
                  .toString("ascii")
                  .replace("cursor", ""),
                10
              );
        const quotes = await context.repositories.quote.find({
          first: args.first,
          after,
          authorId: obj.id,
          query: args.query,
        });
        const quotesCount = await context.repositories.quote.count({
          authorId: obj.id,
          query: args.query,
        });
        const edges = nodesToEdges(quotes, after);
        return toConnection(
          edges,
          quotesCount,
          edges.length === args.first,
          after > 0
        );
      },
    },
    createdAt: {
      type: new GraphQLNonNull(GraphQLString),
      description: "",
      resolve: (obj: Author): string => {
        return formatDate(new Date(obj.createdAt));
      },
    },
  }),
});

export default author;
