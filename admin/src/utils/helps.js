//easy generate request api url
export function easyGenerateUrl(baseUrl,paramsObj){
  if(typeof paramsObj === 'object' && paramsObj!=={}){
    const keys=[... Object.keys(paramsObj)];
    for(let i=0,j=keys.length;i<j;i++){
      if(i===0){
        baseUrl+=`?${keys[i]}=${paramsObj[keys[i]]}`
      }
      else{
        baseUrl+=`&${keys[i]}=${paramsObj[keys[i]]}`
      }
    }
  }
  return baseUrl
}
