/**
 * @author ZeroTower
 * @Date 2021/10/14
 */

const  generateWrongModel=(message,errorCode)=>{
    return {
        status:errorCode || 'error',
        msg:message,
        data:null
    }
}

const generateRightModel=(message,data)=>{
    return {
        status:200,
        msg:message,
        data:data || null
    }
}

const generateWrongDataPlus=(msg,wrongData)=>{
    return{
        msg,
        wrongData
    }
}

module.exports={
    generateWrongModel,
    generateRightModel,
    generateWrongDataPlus
}
