"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const body_parser_1 = __importDefault(require("body-parser"));
const db_1 = __importDefault(require("./db"));
const Block_1 = __importDefault(require("./Block"));
const dijktras_1 = __importDefault(require("./dijktras"));
const app = (0, express_1.default)();
const PORT = 3000;
app.use(body_parser_1.default.json());
app.get("/blocks", async (req, res) => {
    try {
        const blocks = await Block_1.default.find();
        res.json(blocks);
    }
    catch (err) {
        console.log("Error fetching blocks");
        res.status(500).json({ message: err.message });
    }
});
app.post("/calculate-path", async (req, res) => {
    const { startBlock, endBlock } = req.body;
    const blocks = await Block_1.default.find();
    const graph = {};
    blocks.forEach((block) => {
        graph[block.name] = {};
        block.neighbors.forEach((neighbor) => {
            graph[block.name][neighbor.name] = neighbor.distance;
        });
    });
    const shortestPath = (0, dijktras_1.default)(graph, startBlock, endBlock);
    res.json({ shortestPath });
});
db_1.default.once("open", () => {
    app.listen(PORT, () => {
        console.log("Server running on port: " + PORT);
    });
    console.log("Connected to database");
});
//# sourceMappingURL=index.js.map