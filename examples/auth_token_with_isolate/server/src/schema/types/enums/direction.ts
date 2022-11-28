import { GraphQLEnumType } from "graphql";

export default new GraphQLEnumType({
  name: "Direction",
  description: "The ordering direction.",
  values: {
    ASC: {
      description: "Specifies an ascending order for a given orderBy argument.",
      value: "asc",
    },
    DESC: {
      description: "Specifies a descending order for a given orderBy argument.",
      value: "desc",
    },
  },
});
