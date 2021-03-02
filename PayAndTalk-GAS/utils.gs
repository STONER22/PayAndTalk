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