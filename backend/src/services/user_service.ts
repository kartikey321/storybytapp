import { Readable } from "stream";
import { StoryModel, User, UserModel } from "../interfaces";

class UserService {
  async createUser(map: Record<string, any>) {
    var newUser: User = new UserModel(map);
    newUser.save();
  }
  async getUser(id: string): Promise<User | null> {
    return await UserModel.findById(id);
  }
}

export default new UserService();
