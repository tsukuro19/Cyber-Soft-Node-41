import {response} from "../../config/response.js";
import sequelize from "../models/connect.js";
import initModels from "../models/init-models.js";


const model=initModels(sequelize);


const getListLikeRestaurantAndUser=async (req,res)=>{
    try{
        const {id}=req.params;
        const lstUser=await model.users.findAll({
            include: [{
                model: model.like_res,
                as: 'like_res',
                where: { res_id: id },
                attributes: [], // Specify no attributes for like_res to avoid selecting non-existent columns
                include: [{
                    model: model.restaurant,
                    as: 're',
                    attributes: [] // Specify no attributes for restaurant if only filtering is needed
                }]
            }],
            attributes: ['full_name']
        });
        response(res,lstUser,"Success",200);
    }catch(error){
        response(res,error,"Have a problem",500);
    }
}

const postLikeRestaurant=async(req,res)=>{
    try{
        const {user_id,res_id}=req.body;
        const newLikeRes=await model.like_res.create({
            user_id:user_id,
            res_id:res_id,
            date_like:new Date(),
        });
        response(res,newLikeRes,"Save success",200);
    }catch(error){
        response(res,error,"Have a problem",500);
    }
}

const unlikeRestaurant=async(req,res)=>{
    try{
        const {user_id,res_id}=req.body;
        const deleteLikeRes=await model.like_res.destroy({
            where:{
                user_id:user_id,
                res_id:res_id
            }
        });
        response(res,deleteLikeRes,"Delete success",200);
    }catch(error){
        response(res,error,"Have a problem",500);
    }
}

export {
    getListLikeRestaurantAndUser,
    postLikeRestaurant,
    unlikeRestaurant
}