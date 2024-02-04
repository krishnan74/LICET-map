import express from "express";
import bodyParser from "body-parser";
import db from "./db";
import Block from "./Block";
import { IBlock } from "./Block";
import dijktras from "./dijktras";
import e from "express";

interface Neighbors {
  [name: string]: number;
}

const app = express();
const PORT = 3000;

app.use(bodyParser.json());

app.get("/blocks", async (req, res) => {
    try{
        const blocks = await Block.find();
        res.json(blocks);
    }
    catch(err){
        console.log("Error fetching blocks");
        res.status(500).json({message: err.message});
    }
});

app.post("/calculate-path", async (req, res) => {
  const { startBlock, endBlock } = req.body;

  const blocks: IBlock[] = await Block.find();
  const graph: Record<string, Neighbors> = {};

  blocks.forEach((block) => {
    graph[block.name] = {};
    block.neighbors.forEach((neighbor) => {
      graph[block.name][neighbor.name] = neighbor.distance;
    });
  });

  const shortestPath = dijktras(graph, startBlock, endBlock);
  res.json({ shortestPath });
});

db.once("open", () => {
  app.listen(PORT, () => {
    console.log("Server running on port: " + PORT);
  });
  console.log("Connected to database");
});
