import { Request, Response } from "express";
import RegexService from "../services/regex_service";
import story_service from "../services/story_service";
class StoryController {
  async createStory(req: Request, res: Response) {
    /*
     id:string,
    name:string,
    description:string | undefined,
    thumbnailUrl:string,
    audioUrl:string,
    audioLength:number,
    publisherId:string,*/
    var body = req.body;
    if (
      !(
        body.name ||
        body.thumbnailUrl ||
        body.audioUrl ||
        body.audioLength ||
        body.publisherId
      )
    ) {
      res.status(400).json({ message: "Please provide all the fields" });
      return;
    }
  }

  async getStory(req: Request, res: Response): Promise<void> {
    let body = req.body;
    if (!body.id) {
      res.status(400).json({ message: "Mssing id " });
      return;
    }
    var data1 = story_service.getStory(body.id);
    if (data1 == null) {
      res.status(400).json({ message: "Invalid id " });
      return;
    }
    res.status(200).json({ data: data1 });
  }
}
