import { model, Schema,Document } from "mongoose"

export interface Story extends Document{
    id:string,
    name:string,
    description:string,
    thumbnailUrl:string,
    audioUrl:string,
    audioLength:number,
    publisherId:string,
    publisherName:string,
    likes:string[],
    tags:string[]
}

export const StorySchema = new Schema<Story>({
    id: { type: String, required: true,unique:true },
    name: { type: String, required: true },
    description: { type: String, required: true },
    thumbnailUrl: { type: String, required: true },
    audioUrl: { type: String, required: true },
    audioLength: { type: Number, required: true },
    publisherId: { type: String, required: true },
    publisherName: { type: String, required: true },
    likes: [{ type: String }],
    tags: [{ type: String }]
  });

  export const StoryModel = model<Story>('Story', StorySchema);
