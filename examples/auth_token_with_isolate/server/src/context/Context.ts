import DataLoader from "dataloader";

interface RepositoriesContext {
  author: AuthorRepository;
  quote: QuoteRepository;
  authentication: AuthenticationRepository;
}

interface LoadersContext {
  author: DataLoader<number, Author>;
}

export default interface Context {
  repositories: RepositoriesContext;
  loaders: LoadersContext;
  accessToken?: string;
  validToken: boolean;
  uid?: string;
}
