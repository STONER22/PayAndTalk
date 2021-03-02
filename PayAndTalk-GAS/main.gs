/*
  Remove "//" to activate service
*/
const SERVICES =[
  // "fondy", // line 12
  // "Paypal",
  // "Qiwi wallet",
]

const sheetUrl= "<< Enter sheet url here >>";

const FONDY_settings={
  // Get data from https://portal.fondy.eu/mportal/#/settings/
  merchant:00000, // <= Enter youre merchant id
  key:"<< Enter payment key >>", // <= Enter youre payment id

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

console.timeEnd("Settings Test")}