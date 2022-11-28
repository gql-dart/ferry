import { GraphQLNonNull } from "graphql";
import Context from "../../context/Context";
import { default as jwtToken } from "../types/login";
import loginInput from "../types/inputs/loginInput";

const login = {
  type: jwtToken,
  args: {
    input: {
      type: new GraphQLNonNull(loginInput),
    },
  },
  resolve: (_, { input }, context: Context): Promise<JwtToken> => {
    return context.repositories.authentication.login(input);
  },
};

export default login;
