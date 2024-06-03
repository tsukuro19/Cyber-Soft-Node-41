import {response} from "../../config/response.js";
import sequelize from "../models/connect.js";
import initModels from "../models/init-models.js";

const model=initModels(sequelize);


const fetchDatabase=async (full_name,food_name,sub_foods)=>{
    const user_object=await model.users.findAll({
        attributes:['user_id'],
        where:{
            full_name:full_name
        }
    });

    const food_object=await model.food.findAll({
        attributes:['food_id'],
        where:{
            food_name:food_name
        }
    });

    let sub_food_id=await Promise.all(
        sub_foods.map(async (sub_food) => {
            const sub_food_object=await model.sub_food.findAll({
                attributes:['sub_id'],
                where:{
                    sub_name:sub_food
                }
            });
            return sub_food_object[0].dataValues.sub_id;
        })
    )

    return {user_object,food_object,sub_food_id};
}

const addOrder=async (req,res)=>{
    try{
        const {full_name,food_name,amount,sub_food,code}=req.body;
        const {user_object,food_object,sub_food_id}=await fetchDatabase(full_name,food_name,sub_food);

        const user_id=user_object[0].dataValues.user_id;
        const food_id=food_object[0].dataValues.food_id;

        const orderObject=await model.orders.create({
            user_id:user_id,
            food_id:food_id,
            amount:amount,
            code:code,
            arr_sub_id:sub_food_id.toString()
        });

        response(res,orderObject,"Success",200);
    }catch(error){
        response(res,error,"Have a problem",500);
    }
}

export default addOrder;