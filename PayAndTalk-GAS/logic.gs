Logger = BetterLog.useSpreadsheet("1N_Sn_49jqMKLSoY0D6EhTcs6fOISsqLzfQF5wp5xRnU")
function doPost(e) {
  if (!e.parameter && !e.parameter.t){
    console.error("Without parameters")
    return;
  }
  Logger.log(JSON.stringify(e))
  switch(e.parameter.t){
    case "fondy":
    (SERVICES["fondy"])?doFondy(e):0;
    break;
    case "login":
    if (e.postData.contents == getAccessKey()){
      return ContentService.createTextOutput(publishToWeb(sheetUrl)) 
    }
    break;
    case "delete":
    if (e.postData.contents == getAccessKey()){
      ContentService.createTextOutput(objDB.deleteRow(objDB.open(getDBsheetId()),"data",{username:e.parameter.u}))
    }
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
