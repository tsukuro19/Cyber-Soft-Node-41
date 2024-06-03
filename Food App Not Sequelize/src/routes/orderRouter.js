import express from "express";
import addOrder from "../controllers/orderControllers.js"


const orderRouter= express.Router();

orderRouter.post("/add-order",addOrder);

export default orderRouter;