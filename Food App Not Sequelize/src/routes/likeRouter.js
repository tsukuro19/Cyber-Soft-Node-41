import express from "express";
import {getListLikeRestaurantAndUser,postLikeRestaurant,unlikeRestaurant} from "../controllers/likeControllers.js"

const likeRouter=express.Router();

likeRouter.get("/list-like-restaurant/:id",getListLikeRestaurantAndUser);
likeRouter.post("/post-like-restaurant",postLikeRestaurant);
likeRouter.delete("/unlike-restaurant",unlikeRestaurant);

export default likeRouter;