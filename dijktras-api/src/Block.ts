import mongoose, {Document, Schema} from "mongoose";

export interface IBlock extends Document {
    name: string;
    neighbors: {
        name: string,
        distance: number
    }[];
}

const blockSchema = new Schema<IBlock>({
    name: String,
    neighbors: [{
        name: String,
        distance: Number
    }]
});

const Block = mongoose.model<IBlock>("Block", blockSchema);

export default Block;

