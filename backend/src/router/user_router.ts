import { Router } from "express";
import UserController from "../controllers/user_controller";
export const router = Router();

router.post("/create-user", UserController.createUser);

