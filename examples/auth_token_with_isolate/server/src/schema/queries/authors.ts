import { GraphQLInt, GraphQLString, GraphQLList } from "graphql";
import Context from "../../context/Context";
import authorConnection from "../types/connections/authorConnection";
import authorsOrder from "../types/inputs/authorsOrder";
import nodesToEdges from "./nodesToEdges";
import toConnection from "./toConnection";

interface AuthorsQueryArguments {
  first: number;
  after: string;
  firstName: string;
  lastName: string;
  orderBy: any[];
}

export default {
  type: authorConnection,
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
    firstName: {
      type: GraphQLString,
    },
    lastName: {
      type: GraphQLString,
    },
    orderBy: {
      type: new GraphQLList(authorsOrder),
    },
  },
  resolve: async (_, args: AuthorsQueryArguments, context: Context) => {
    const after =
      typeof args.after === "undefined" || args.after === null
        ? 0
        : parseInt(
            Buffer.from(args.after, "base64")
              .toString("ascii")
              .replace("cursor", ""),
            10
          );
    const authors = await context.repositories.author.find({
      first: args.first,
      after,
      firstName: args.firstName,
      lastName: args.lastName,
      orderBy: args.orderBy,
    });
    const authorsCount = await context.repositories.author.count({
      firstName: args.firstName,
      lastName: args.lastName,
    });
    const edges = nodesToEdges(authors, after);
    return toConnection(
      edges,
      authorsCount,
      edges.length === args.first,
      after > 0
    );
  },
};
