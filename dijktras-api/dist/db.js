"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = __importDefault(require("mongoose"));
const CONNECTION_STRING = "mongodb+srv://divyakrishnanr74:krishnanoo7@cluster0.m8qkgsh.mongodb.net/";
mongoose_1.default.connect(CONNECTION_STRING, {});
exports.default = mongoose_1.default.connection;
//# sourceMappingURL=db.js.map