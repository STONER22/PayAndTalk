function toSHA1(text) {
  var rawHash = Utilities.computeDigest(Utilities.DigestAlgorithm.SHA_1, text);
  var txtHash = "";
  
  for (i = 0; i < rawHash.length; i++) {
	 var hashVal = rawHash[i];
	 if (hashVal < 0) {
		hashVal += 256;
	 }
	 if (hashVal.toString(16).length == 1) {
		txtHash += '0';
	 }
	 txtHash += hashVal.toString(16);
  }
  return txtHash;
}

function getDBsheetId(){
  return SpreadsheetApp.openByUrl(sheetUrl).getSheetId()
}

function generateRandKey(){

   var result           = '';
   var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789#$%*';
   var charactersLength = characters.length;
   for ( var i = 0; i < 10; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
   }
   return result;
}

function saveAccessKey(key){
  var name = "}" + "accessCode" + '/' + key

	
  //
var triggers = ScriptApp.getProjectTriggers(),
		reg = new RegExp('^' + "}" + "accessCode" + '/' + '(.*)$'),
		i, trigger;

	for (i = 0; i < triggers.length; i++) {
		trigger = triggers[i];

		if (reg.test(trigger.getHandlerFunction())) {
			ScriptApp.deleteTrigger(trigger);
		}
	}
  //

	ScriptApp.newTrigger(name)
		.timeBased()
		.atDate(3000, 1, 1)
		.create();
}

function getAccessKey(){
  var triggers = ScriptApp.getProjectTriggers(),
		reg = new RegExp('^' + "}" + "accessCode" + '/' + '(.*)$'),
		ma, i, name;

	for (i = 0; i < triggers.length; i++) {
		name = triggers[i].getHandlerFunction();
		if (!(ma = name.match(reg))) continue;

		return ma[1];
	}

	return null;
}

function publishToWeb(sheeturl){ 
  var ss = SpreadsheetApp.openByUrl(sheeturl);
  var fileId = ss.getId();
  var revisions = Drive.Revisions.list(fileId); 
  var items = revisions.items; 
  var revisionId =items[items.length-1].id; 
  var resource = Drive.Revisions.get(fileId, revisionId); 
  resource.published = true;
  resource.publishAuto = true;
  resource.publishedOutsideDomain = true;
  Drive.Revisions.update(resource, fileId, revisionId); 
  return fileId
}