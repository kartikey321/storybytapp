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
    await user_service.createUser(body);
    res.status(200).json({ message: "User Saved" });
  }

  async getUser(req: Request, res: Response): Promise<void> {
    let body = req.body;
    if (!body.id) {
      res.status(400).json({ message: "Mssing id " });
      return;
    }
    var data1 = user_service.getUser(body.id);
    if (data1 == null) {
      res.status(400).json({ message: "Invalid id " });
      return;
    }
    res.status(200).json({ data: data1 });
  }

  static async getAllUsers(req: Request, res: Response): Promise<void> {
    var data1 = await user_service.getAllUsers();
   
    res.status(200).json({ data: data1 });
  }
}
