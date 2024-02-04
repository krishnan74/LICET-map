import mongoose from "mongoose";

const CONNECTION_STRING =
  "mongodb+srv://divyakrishnanr74:krishnanoo7@cluster0.m8qkgsh.mongodb.net/";

mongoose.connect(CONNECTION_STRING, {});

export default mongoose.connection;
