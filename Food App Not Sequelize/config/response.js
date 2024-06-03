export const response=(res,data,mess,code)=>{
    res.json({
        statusCode:code,
        data:data,
        mess:mess,
        date:new Date()
    })
}