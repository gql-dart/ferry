import database from "../database";

export default class AuthorKnexRepository implements AuthorRepository {
  public async get(id: number): Promise<Author> {
    return database.select().from("author").where("id", id).first();
  }

  public async getMany(ids: number[]): Promise<Author[]> {
    return database.select().from("author").whereIn("id", ids);
  }

  public async find(
    params: AuthorRepository.FindParameters
  ): Promise<Author[]> {
    const { first, after, firstName, lastName, orderBy } = params;

    return database
      .select()
      .from("author")
      .modify((queryBuilder) => {
        if (typeof after !== "undefined" && after !== null) {
          queryBuilder.offset(after);
        }

        if (typeof firstName !== "undefined" && firstName !== null) {
          queryBuilder.where("firstName", "like", `%${firstName}%`);
        }

        if (typeof lastName !== "undefined" && lastName !== null) {
          queryBuilder.where("lastName", "like", `%${lastName}%`);
        }

        if (Array.isArray(orderBy)) {
          orderBy.forEach((ob) => queryBuilder.orderBy(ob.field, ob.direction));
        }
      })
      .limit(first);
  }

  public async count(
    params: AuthorRepository.CountParameters
  ): Promise<number> {
    const { firstName, lastName } = params;

    return database
      .count({ count: "*" })
      .from("author")
      .modify((queryBuilder) => {
        if (typeof firstName !== "undefined" && firstName !== null) {
          queryBuilder.where("firstName", "like", `%${firstName}%`);
        }

        if (typeof lastName !== "undefined" && lastName !== null) {
          queryBuilder.where("lastName", "like", `%${lastName}%`);
        }
      })
      .first()
      .then((result) => result.count);
  }

  public async create(
    params: AuthorRepository.CreateParameters
  ): Promise<Author> {
    return database
      .insert({
        firstName: params.firstName,
        lastName: params.lastName,
      })
      .into("author")
      .then((ids) => {
        return this.get(ids[0]);
      });
  }

  public async update(
    id: number,
    firstName: string,
    lastName: string
  ): Promise<Author> {
    return database
      .table("author")
      .where("id", id)
      .modify((queryBuilder) => {
        if (typeof firstName !== "undefined" && firstName !== null) {
          queryBuilder.update("firstName", firstName);
        }

        if (typeof lastName !== "undefined" && lastName !== null) {
          queryBuilder.update("lastName", lastName);
        }
      })
      .then((updatedRows) => {
        if (updatedRows.length === 0) {
          throw new Error("Author not found!");
        }
        return updatedRows;
      })
      .then(() => {
        return this.get(id);
      });
  }

  public async delete(id: number): Promise<Author> {
    const author = await this.get(id);

    await database.table("author").where("id", id).del();

    return author;
  }
}
