import express from "express";
import {getListRateUserWithRestaurant,getListRateRestaurantWithUser,postRateRestaurant} from "../controllers/rateControllers.js"

const rateRouter=express.Router();

rateRouter.get("/get-list-rate-user/:id",getListRateUserWithRestaurant);
rateRouter.get("/get-list-rate-restaurant/:id",getListRateRestaurantWithUser);

rateRouter.post("/post-rate-restaurant",postRateRestaurant);


export default rateRouter;