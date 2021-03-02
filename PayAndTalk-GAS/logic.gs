function doPost(e) {
  if (!e.parameter && !e.parameter.t){
    console.error("Without parameters")
    return;
  }
  Logger.log(JSON.stringify(e))
  switch(e.parameter.t){
    case "fondy":
    doFondy(e)
    break;
  }
  return ContentService.createTextOutput("{}")
}

function doGet(e) {
  if (!e.parameter){
    console.error("Without parameters")
    return;
  }
  Logger.log(JSON.stringify(e.parameter))

}
