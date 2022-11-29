import { Knex } from "knex";

/**
 * Migration to initialize database - create two tables with relationships between them.
 *
 * Command:
 * ./node_modules/.bin/knex migrate:make init -x ts --connection localhost --client mysql2 --migrations-directory ./src/migrations/
 *
 * @see https://knexjs.org/#Migrations-CLI
 * @param knex
 */
export async function up(knex: Knex): Promise<any> {
  return knex.schema
    .createTable("author", (author) => {
      author.increments("id").primary();
      author.string("firstName", 255).notNullable();
      author.string("lastName", 255).notNullable();
      author
        .timestamp("createdAt")
        .notNullable()
        .defaultTo(knex.raw("CURRENT_TIMESTAMP"));
      author
        .timestamp("updatedAt")
        .notNullable()
        .defaultTo(knex.raw("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"));
    })
    .createTable("quote", (quote) => {
      quote.increments("id").primary();
      quote
        .integer("authorId")
        .unsigned()
        .notNullable()
        .references("id")
        .inTable("author")
        .onDelete("cascade");
      quote.string("text", 255).notNullable();
      quote
        .timestamp("createdAt")
        .notNullable()
        .defaultTo(knex.raw("CURRENT_TIMESTAMP"));
      quote
        .timestamp("updatedAt")
        .notNullable()
        .defaultTo(knex.raw("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"));
    });
}

export async function down(knex: Knex): Promise<any> {
  return knex.schema.dropTable("quote").dropTable("author");
}
