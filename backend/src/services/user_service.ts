import { Readable } from "stream";
import { StoryModel, User, UserModel } from "../interfaces";

class UserService {
  async createUser(map: Record<string, any>): Promise<void> {
    try {
      console.log("saving user");
      var newUser: User = new UserModel(map);
      newUser.save();
      console.log("user saved");
    } catch (error) {
      console.log(error);
    }
  }
  async getUser(id: string): Promise<User | null> {
    return await UserModel.findById(id);
  }
  async getAllUsers(): Promise<User[]> {
    var data = await UserModel.find();
   
    return data;
  }
}

export default new UserService();
