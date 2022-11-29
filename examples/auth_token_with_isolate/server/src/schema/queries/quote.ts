import { GraphQLID, GraphQLNonNull } from "graphql";
import Context from "../../context/Context";
import { default as quoteType } from "../types/quote";

const quote = {
  type: quoteType,
  args: {
    id: {
      type: new GraphQLNonNull(GraphQLID),
    },
  },
  resolve: (_, { id }, context: Context) => {
    return context.repositories.quote.get(id);
  },
};

export default quote;
