import express, { Express, Request, Response } from "express";
import dotenv from "dotenv";
import cors from "cors";
import { UserRouter } from "./router";
dotenv.config();
import { connect } from "mongoose";

const app: Express = express();
const port = process.env.PORT || 3001;
// Enable CORS for all requests
app.use(cors());

// Middleware to parse JSON bodies
app.use(express.json());

connect(
  "mongodb+srv://storybytcom:storybyt.com@cluster0.zl61c.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
);
app.use("/api/user", UserRouter);

app.get("/", (req: Request, res: Response) => {
  res.send("Express + TypeScript Server");
});

// app.post("/register-company", CompanyController.createCompany);
// app.post("/create-lead", LeadController.createLead);

app.listen(port, () => {
  console.log(`[server]: Server is running at http://localhost:${port}`);
});
