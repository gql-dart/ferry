import { Knex } from "knex";

export async function seed(knex: Knex): Promise<any> {
  return knex("author")
    .del()
    .then(() => {
      return knex("author").insert([
        {
          id: 1,
          firstName: "John",
          lastName: "Johnson",
          createdAt: "2020-07-02 11:06:01",
        },
        {
          id: 2,
          firstName: "Martin",
          lastName: "Fowler",
          createdAt: "2020-07-02 11:06:02",
        },
        {
          id: 3,
          firstName: "Jason",
          lastName: "Lengstorf",
          createdAt: "2020-07-02 11:06:03",
        },
        {
          id: 4,
          firstName: "Linus",
          lastName: "Torvalds",
          createdAt: "2020-07-02 11:06:04",
        },
        {
          id: 5,
          firstName: "Robert",
          lastName: "Martin",
          createdAt: "2020-07-02 11:06:05",
        },
        {
          id: 6,
          firstName: "Bill",
          lastName: "Gates",
          createdAt: "2020-07-02 11:06:06",
        },
        {
          id: 7,
          firstName: "Felipe",
          lastName: "Fortes",
          createdAt: "2020-07-02 11:06:07",
        },
        {
          id: 8,
          firstName: "Niels",
          lastName: "Bohr",
          createdAt: "2020-07-02 11:06:08",
        },
        {
          id: 9,
          firstName: "Jamie",
          lastName: "Zawinski",
          createdAt: "2020-07-02 11:06:09",
        },
      ]);
    })
    .then(() => {
      return knex("quote")
        .del()
        .then(() => {
          return knex("quote").insert([
            {
              id: 1,
              authorId: 1,
              text: "First, solve the problem. Then, write the code.",
              createdAt: "2020-07-02 12:43:00",
            },
            {
              id: 2,
              authorId: 2,
              text: "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.",
              createdAt: "2020-07-02 12:43:01",
            },
            {
              id: 3,
              authorId: 3,
              text: "If you stop learning, then the projects you work on are stuck in whatever time period you decided to settle.",
              createdAt: "2020-07-02 12:43:02",
            },
            {
              id: 4,
              authorId: 4,
              text: "Bad programmers worry about the code. Good programmers worry about the data structures and their relationships.",
              createdAt: "2020-07-02 12:43:03",
            },
            {
              id: 5,
              authorId: 4,
              text: "Most good programmers do programming not because they expect to get paid or get adulation by the public, but because it is fun to program.",
              createdAt: "2020-07-02 12:43:04",
            },
            {
              id: 6,
              authorId: 4,
              text: "When you say 'I wrote a program that crashed Windows,' people just stare at you blankly and say 'Hey, I got those with the system, for free.'",
              createdAt: "2020-07-02 12:43:05",
            },
            {
              id: 7,
              authorId: 4,
              text: "A computer is like air conditioning - it becomes useless when you open Windows.",
              createdAt: "2020-07-02 12:43:06",
            },
            {
              id: 8,
              authorId: 4,
              text: "If you think your users are idiots, only idiots will use it.",
              createdAt: "2020-07-02 12:43:07",
            },
            {
              id: 9,
              authorId: 5,
              text: "You should name a variable using the same care with which you name a first-born child.",
              createdAt: "2020-07-02 12:43:08",
            },
            {
              id: 10,
              authorId: 6,
              text: "If you are born poor, it is not your mistake, but if you die poor it is your mistake.",
              createdAt: "2020-07-02 12:43:09",
            },
            {
              id: 11,
              authorId: 6,
              text: "No one will need more than 637Kb of memory for a personal computer.",
              createdAt: "2020-07-02 12:43:10",
            },
            {
              id: 12,
              authorId: 7,
              text: "Debugging is like being the detective in a crime movie where you are also the murderer.",
              createdAt: "2020-07-02 12:43:11",
            },
            {
              id: 13,
              authorId: 8,
              text: "An expert is a person who has made all the mistakes that can be made in a very narrow field.",
              createdAt: "2020-07-02 12:43:12",
            },
            {
              id: 14,
              authorId: 9,
              text: "Some people, when confronted with a problem, think “I know, I’ll use regular expressions.” Now they have two problems.",
              createdAt: "2020-07-02 12:43:13",
            },
          ]);
        });
    });
}
