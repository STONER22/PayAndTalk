/*
  Remove "//" to activate service
*/
const SERVICES =[
   "fondy", // line 12
  // "Paypal",
  // "Qiwi wallet",
]

const sheetUrl= "https://docs.google.com/spreadsheets/d/1N_Sn_49jqMKLSoY0D6EhTcs6fOISsqLzfQF5wp5xRnU/edit#gid=0"//"<< Enter sheet url here >>";

const FONDY_settings={
  // Get data from https://portal.fondy.eu/mportal/#/settings/
  merchant:1451065, // <= Enter youre merchant id
  key:"LDcCpaRRjFrNPuItl6uNcP3iS7HUqnKd"//"<< Enter payment key >>", // <= Enter youre payment id

}

function test(){
  console.log(ScriptApp.getOAuthToken())
}


function testAll(){
  console.time("Settings Test")
  i = console.info
  e = console.error
  i("START TEST SETTINGS")
  if (SERVICES.length > 0){
    i("Service test pass")
  }else{
    e("Select at least one service")
  }

  if(sheetUrl.toLowerCase().match(/https/)){
    i("SheetURL test pass")
  }else{
    e("Please enter SheetURL")
  }

  try{
    let s = SpreadsheetApp.openByUrl(sheetUrl)
    i("Sheet url id good")
    let fr = s.getSheets()
    for (x of fr){
      if(x.getSheetId() === 0){
        x.setName("data")
        r = x.getRange("A1:C1")
        r.setValues([["username","time","price"]]);
        //r.deleteColumns(2, 23);
        i("Success to create data sheet")
      }
    }
    isCr=false
    for (x of fr){
      if (x.getSheetName() == "tempIds"){
        isCr = !0
      }
    }
    if (!isCr){
      r = s.insertSheet("tempIds")
      r.deleteColumns(2, 25);
      i("Success to create TempIds sheet")
    }
  }catch(er){
    e(er)
    return
  }



  ackey = generateRandKey()
  i("------------------------------")
  console.warn("Youre access key:  "+ackey)
  i("------------------------------")
  saveAccessKey(ackey)

console.timeEnd("Settings Test")}
function GETACCESSKEY(){
  ackey = getAccessKey()
  if (!ackey){
    ackey = generateRandKey()
    saveAccessKey(ackey)
  }
  console.info("------------------------------")
  console.warn("Youre access key:  "+ackey)
  console.info("------------------------------")
}