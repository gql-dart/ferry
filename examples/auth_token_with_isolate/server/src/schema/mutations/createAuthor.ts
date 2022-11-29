import { GraphQLNonNull } from "graphql";
import { verifyLoggedIn } from "../../utils/functions";
import Context from "../../context/Context";
import { default as authorType } from "../types/author";
import newAuthor from "../types/inputs/newAuthor";

const createAuthor = {
  type: authorType,
  args: {
    input: {
      type: new GraphQLNonNull(newAuthor),
    },
  },
  resolve: (_, { input }, context: Context): Promise<any> => {
    verifyLoggedIn(context);
    return context.repositories.author.create(input);
  },
};

export default createAuthor;
