import Block from "./Block";
import db from "./db";

db.once("open", async () => {
  Block.deleteMany();
  const blocks = [
    {
      name: "A",
      neighbors: [
        {
          name: "F",
          distance: 3,
        },
        {
          name: "I",
          distance: 3,
        },
        {
          name: "a",
          distance: 2,
        },
      ],
    },

    {
      name: "I",
      neighbors: [
        {
          name: "A",
          distance: 3,
        },
        {
          name: "J",
          distance: 3,
        },
        {
          name: "i",
          distance: 2,
        },
      ],
    },

    {
      name: "J",
      neighbors: [
        {
          name: "I",
          distance: 3,
        },
        {
          name: "E",
          distance: 3,
        },
        {
          name: "j",
          distance: 2,
        },
      ],
    },

    {
      name: "E",
      neighbors: [
        {
          name: "J",
          distance: 3,
        },
        {
          name: "F",
          distance: 3,
        },
        {
          name: "e",
          distance: 2,
        },
      ],
    },

    {
      name: "F",
      neighbors: [
        {
          name: "E",
          distance: 3,
        },
        {
          name: "A",
          distance: 3,
        },
        {
          name: "f",
          distance: 2,
        },
      ],
    },

    {
      name: "a",
      neighbors: [
        {
          name: "A",
          distance: 2,
        },
        {
          name: "i",
          distance: 1,
        },
        {
          name: "f",
          distance: 1,
        },
      ],
    },

    {
      name: "i",
      neighbors: [
        {
          name: "I",
          distance: 2,
        },
        {
          name: "a",
          distance: 1,
        },
        {
          name: "j",
          distance: 1,
        },
      ],
    },

    {
      name: "j",
      neighbors: [
        {
          name: "J",
          distance: 2,
        },
        {
          name: "i",
          distance: 1,
        },
        {
          name: "e",
          distance: 1,
        },
      ],
    },

    {
      name: "e",
      neighbors: [
        {
          name: "E",
          distance: 2,
        },
        {
          name: "j",
          distance: 1,
        },
        {
          name: "f",
          distance: 1,
        },
      ],
    },

    {
      name: "f",
      neighbors: [
        {
          name: "F",
          distance: 2,
        },
        {
          name: "a",
          distance: 1,
        },
        {
          name: "e",
          distance: 1,
        },
      ],
    },
  ];
  await Block.insertMany(blocks);
});
