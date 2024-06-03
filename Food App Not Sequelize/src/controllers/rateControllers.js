import {response} from "../../config/response.js";
import sequelize from "../models/connect.js";
import initModels from "../models/init-models.js";


const model=initModels(sequelize);

const getListRateUserWithRestaurant=async (req,res)=>{
    try{
        const restaurant_id=req.params.id;
        const lstUser=await model.users.findAll({
            include:[{
                model:model.rate_res,
                as:"rate_res",
                where:{res_id:restaurant_id},
                attributes: [],
                include:[{
                    model:model.restaurant,
                    as: 're',
                }]
            }],
            attributes:["full_name"]
        });
        response(res,lstUser,"Success",200);
    }catch(error){
        response(res,error,"Have a problem",500);
    }
}

const getListRateRestaurantWithUser=async(req,res)=>{
    try{
        const userId=req.params.id;
        const lstRes=await model.restaurant.findAll({
            include:[{
                model:model.rate_res,
                as:"rate_res",
                where:{user_id:userId},
                attributes:[],
                include:[{
                    model:model.users,
                    as:"user"
                }]
            }],
            attributes:["res_name"]
        });
        const user_Id=await model.users.findAll({
            where:{full_name:"John Doe"},
            attributes:["user_id"]
        });
        console.log(user_Id[0].dataValues.user_id);
        response(res,lstRes,"Success",200);
    }catch(error){
        response(res,error,"Have a problem",500);
    }
}

const postRateRestaurant=async (req,res)=>{
    try{
        const {user_id,res_id,amount}=req.body;
        const newRateRes=await model.rate_res.create({
            user_id:user_id,
            res_id:res_id,
            amount:amount,
            date_rate:new Date()
        });
        response(res,newRateRes,"Success",200);
    }catch(error){
        response(res,error,"Have a problem",500);
    }
}

export {
    getListRateUserWithRestaurant,
    getListRateRestaurantWithUser,
    postRateRestaurant
}