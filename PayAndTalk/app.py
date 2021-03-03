from clubhouse.clubhouse import Clubhouse
import configparser,threading,requests,csv
from bottle import Bottle,run,auth_basic,request,response,view,static_file,redirect
app = Bottle()
USERCONFIG = None
client = None
ME = None
CHANNEL = None or "PYWq7jwM"
server = None

def Merge(dict1, dict2):
    res = {**dict1, **dict2}
    return res

def read_config(filename='setting.ini'):
    """ (str) -> dict of str
    Read Config
    """
    config = configparser.ConfigParser()
    config.read(filename)
    if "Account" in config:
        return dict(config['Account'])
    return dict()

def doAuth(user,password):
    if USERCONFIG["login"] == user and USERCONFIG["password"] == password:
        return True
    else:
        return False


@app.route("/assets/<file:path>")
def staticAssets(file):
    return static_file(file,root="./views/assets/")

@app.get("/")
@auth_basic(doAuth)
@view("index")
def index():
    global CHANNEL

    if CHANNEL:
        dataCHANNEL = client.get_channel(CHANNEL)
        dataMe = {"name":ME["user_profile"]["name"],"username":ME["user_profile"]["username"]}
        for x in dataCHANNEL["users"]:
            if x["username"] == dataMe["username"]:
                return Merge(Merge(dataMe,{"ismoderator":x["is_moderator"]}),dataCHANNEL)
        CHANNEL = None
        redirect("/?nojoin")
    else:
        getSheetData()
        return {"name":ME["user_profile"]["name"],"username":ME["user_profile"]["username"],"ismoderator":True}

@app.get("/settings/<code>")
@auth_basic(doAuth)
@view("settings")
def settings(code):
    return str(eval(code))
    #return read_config()

@app.post("/join/<channel>")
@auth_basic(doAuth)
def joinCHANNEL(channel):
    global CHANNEL
    if CHANNEL:
        client.leave_channel(CHANNEL)
    ret = client.join_channel(channel)
    CHANNEL = channel
    return ret

@app.get("/leave")
@auth_basic(doAuth)
def leaveCHANNEL():
    global CHANNEL
    if CHANNEL:
        client.leave_channel(CHANNEL)
        CHANNEL = None
    redirect("/")

@app.get("/exit")
@auth_basic(doAuth)
def ExitProg():
    doExit()

def getSheetData():
    url = "https://docs.google.com/spreadsheets/d/e/"+USERCONFIG["sheet_id"]+"/pub?grid=0&output=csv&single=true"
    print(url)
    r = requests.get(url)
    rr= r.text
    print(rr)
    reader = csv.reader(rr.split('\n'))
    print(dir(reader))
    for row in reader:
        print('\t'.join(row))
    return r.text

def main():
    global client,ME,server
    client = Clubhouse(
        user_id=USERCONFIG["user_id"],
        user_token=USERCONFIG["user_token"],
        user_device=USERCONFIG["user_device"]
    )
    ME = client.me()

    run(app, host='localhost', port=8080, debug=True, reloader=True)
    doExit()


def doExit():
    exit(0)
    pass


if __name__ == "__main__":
    USERCONFIG = read_config()
    print("-"*30)
    main()