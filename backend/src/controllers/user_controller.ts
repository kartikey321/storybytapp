import { User, UserModel } from "../interfaces";
import { Request, Response } from "express";
import RegexService from "../services/regex_service";
import user_service from "../services/user_service";

export default class UserController {
  static async createUser(req: Request, res: Response): Promise<void> {
    var body = req.body;
    if (!(body.id && body.email)) {
      res
        .status(400)
        .json({ message: "Missing required fields: name and email" });
      return;
    }
    if (!RegexService.checkEmail(body.email)) {
      res.status(400).json({ message: "Invalid email format" });
      return;
    }
    user_service.createUser(body);
    var newUser: User = new UserModel(map);
    newUser.save();
  }
}
