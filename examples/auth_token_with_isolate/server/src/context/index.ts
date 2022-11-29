import Context from "./Context";
import AuthorRepository from "../repositories/AuthorKnexRepository";
import QuoteRepository from "../repositories/QuoteKnexRepository";
import authorLoader from "../loaders/authorLoader";
import AuthRepository from "../repositories/AuthRepository";
import jwt from "jsonwebtoken";
import { IncomingMessage } from "http";

const defaultContext = {
  repositories: {
    author: new AuthorRepository(),
    quote: new QuoteRepository(),
    authentication: new AuthRepository(),
  },
  loaders: {
    author: authorLoader,
  },
};

function context(req: IncomingMessage): Context {
  const token = req.headers.authorization?.split(" ")[1];
  return {
    ...defaultContext,
    accessToken: token,
    validToken: verifyToken(token),
  };
}

function verifyToken(token?: string): boolean {
  if (!token) {
    return false;
  }

  try {
    jwt.verify(token, process.env.JWT_SECRET);
    return true;
  } catch (e) {
    return false;
  }
}

export default context;
