declare namespace AuthorRepository {
  interface CreateParameters {
    firstName: string;
    lastName: string;
  }

  interface FindParameters {
    first: number;
    after?: number;
    firstName?: string;
    lastName?: string;
    orderBy?: OrderBy[];
  }

  interface CountParameters {
    firstName?: string;
    lastName?: string;
  }
}

interface AuthorRepository {
  get(id: number): Promise<Author>;

  getMany(ids: number[]): Promise<Author[]>;

  create(params: AuthorRepository.CreateParameters): Promise<Author>;

  update(id: number, firstName: string, lastName: string): Promise<Author>;

  find(params: AuthorRepository.FindParameters): Promise<Author[]>;

  count(params: AuthorRepository.CountParameters): Promise<number>;

  delete(id: number): Promise<Author>;
}

declare namespace QuoteRepository {
  interface FindParameters {
    first: number;
    after?: number;
    authorId?: number;
    query?: string;
  }

  interface CountParameters {
    authorId?: number;
    query?: string;
  }
}

interface QuoteRepository {
  get(id: number): Promise<Quote>;

  find(params: QuoteRepository.FindParameters): Promise<Quote[]>;

  count(params: QuoteRepository.CountParameters): Promise<number>;
}

declare namespace AuthenticationRepository {
  interface LoginParameters {
    username: string;
    password: string;
  }
}

interface AuthenticationRepository {
  login(params: AuthenticationRepository.LoginParameters): Promise<JwtToken>;
}
