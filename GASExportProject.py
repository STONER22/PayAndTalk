#https://gist.github.com/gornostay25/c50afd6608e491e61620eb3fb589d9b8
import requests,configparser,os

filename = "GASsettings.ini"

config = configparser.ConfigParser()
config.read(filename)
if not "GAS" in config:
  print("Please create "+filename+" file!")
  exit(1)
exportFolder = "./PayAndTalk-GAS"
scriptid = config["GAS"]["script_id"]
authGoogleToken = config["GAS"]["token"]

filelist = [ f for f in os.listdir(exportFolder)]
for f in filelist:
    os.remove(os.path.join(exportFolder, f))

r = requests.get("https://script.google.com/feeds/download/export?id="+scriptid+"&format=json",headers={
    "Authorization":  "Bearer "+authGoogleToken
})
files = r.json()["files"]
print("-"*30)
print("Exporting "+str(len(files))+" file(s)")
for x in files:
    ftype = x["type"]
    if ftype == "server_js":
        ftype = "gs"
    with open(exportFolder+"/"+x["name"]+"."+ftype,"w") as f:
        f.write(x["source"])
print("-"*30)