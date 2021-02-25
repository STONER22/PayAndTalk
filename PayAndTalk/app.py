from clubhouse.clubhouse import Clubhouse
import configparser,threading
from bottle import Bottle,run,auth_basic,request,response,view,static_file,ServerAdapter
app = Bottle()
USERCONFIG = None
client = None
ME = None
CHANNEL = None

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

    if CHANNEL:
        return client.get_channel(CHANNEL)
    else:
        return {}

@app.get("/settings/<code>")
@auth_basic(doAuth)
@view("settings")
def settings(code):
    return str(eval(code))
    #return read_config()

@app.get("/join/<channel>")
@auth_basic(doAuth)
def joinCHANNEL(channel):
    global CHANNEL
    if CHANNEL:
        client.leave_channel(CHANNEL)
    client.join_channel(channel)
    CHANNEL = channel
    return {}

@app.get("/leave")
@auth_basic(doAuth)
def leaveCHANNEL():
    global CHANNEL
    if CHANNEL:
        client.leave_channel(CHANNEL)
        CHANNEL = None
    return {}

def main():
    global client,ME
    client = Clubhouse(
        user_id=USERCONFIG["user_id"],
        user_token=USERCONFIG["user_token"],
        user_device=USERCONFIG["user_device"]
    )
    ME = client.me()
    run(app, host='localhost', port=8080,debug=True,reloader=True)
    doExit()


def doExit():
    pass


if __name__ == "__main__":
    USERCONFIG = read_config()
    main()