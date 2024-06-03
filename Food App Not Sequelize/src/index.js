import express from "express";
import cors from 'cors';
import rootRouter from "./routes/rootRouter.js" 

const app=express();
const port=3000;

app.use(express.json());
app.use(cors());

app.use(rootRouter);


app.listen(port,()=>{
    console.log("Sever running http://localhost:3000");
});
