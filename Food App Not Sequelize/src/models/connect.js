import {Sequelize} from 'sequelize';

const sequelize=new Sequelize('FOOD_APP','root','1234',{
    host:'localhost',
    dialect:'mysql',
    port:"3308",
});

export default sequelize;