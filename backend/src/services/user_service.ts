import { User, UserModel } from "../interfaces";

class UserService{
   async createUser(map: Record<string, any>) {
    if(!map['id']){
        
    }
    var newUser: User = new UserModel(map);
    newUser.save();
  }
}

export default new UserService();