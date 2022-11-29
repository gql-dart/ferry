import DataLoader from "dataloader";
import AuthorRepository from "../repositories/AuthorKnexRepository";

async function getAuthorsById(ids: number[]): Promise<Author[]> {
  const authorRepository = new AuthorRepository();
  const authors = await authorRepository.getMany(ids);
  return ids.map((id) => {
    return authors.find((author) => author.id === id);
  });
}

export default new DataLoader(getAuthorsById);
