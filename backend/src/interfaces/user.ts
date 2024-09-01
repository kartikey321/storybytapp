import { Schema, Document, model } from "mongoose";

export interface User extends Document {
  id: string;
  username:string;
  name: string;
  dp: string;
  email: string;
  phone: string;
  stories: string[];
  favourites: string[];
  createdAt: Date;
}
export const UserSchema = new Schema<User>({
  id: { type: String, required: true, unique: true },
  name: { type: String, required: true },
  username:{ type: String, required: true,unique:true },
  dp: { type: String, },
  email: { type: String, required: true, unique: true },
  phone: { type: String, required: true },
  stories: [{ type: String }],
  favourites: [{ type: String }],
  createdAt: { type: Date, default: Date.now },
});
export const UserModel = model<User>("User", UserSchema);
