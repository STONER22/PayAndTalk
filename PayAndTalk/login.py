from clubhouse.clubhouse import Clubhouse
import configparser,re

def write_config(user_id, user_token, user_device, script_id, dashboard_pass,AccessCode, phone_number, filename='setting.ini'):
    """ (str, str, str, str, str, str, str) -> bool
    Write Config. return True on successful file write
    """
    config = configparser.ConfigParser()
    config["Account"] = {
        "user_device": user_device,
        "user_id": user_id,
        "user_token": user_token,
        "script_id":script_id,
        "script_acode":AccessCode
        "password":dashboard_pass,
        "login":phone_number
    }
    with open(filename, 'w') as config_file:
        config.write(config_file)
    return True

def main():
    client = Clubhouse()
    result = None
    user_phone_number = None
    while True:
        user_phone_number = input("[.] Please enter your phone number. (+38268888888) > ")
        result = client.start_phone_number_auth(user_phone_number)
        if not result['success']:
            print(f"[-] Error occured during authentication. ({result['error_message']})")
            continue
        break
    result = None

    while True:
        verification_code = input("[.] Please enter the SMS verification code (1234, 0000, ...) > ")
        result = client.complete_phone_number_auth(user_phone_number, verification_code)
        if not result['success']:
            print(f"[-] Error occured during authentication. ({result['error_message']})")
            continue
        break

    print("[.] Login complete")

    scriptID = None
    regex = r"https:\/\/script\.google\.com\/macros\/s\/(.*)\/exec"
    while 1:
        scriptURL = input("[.] Please enter gateway script url (https://script.google.com/macros/s/.../exec) > ")
        x = re.search(regex, scriptURL)
        if(x[1]):
            scriptID = x[1]
            break
        else:
            print("[!] Bad URL format")
    AccessCode = None
    while 1:
        if passw := input("[.] Please enter script access code > "):
            AccessCode = passw
            break
        else:
            print("[!] Bad code")

    WebLoginP=None
    while 1:
        if passw := input("[.] Please enter web dashboard login password > "):
            WebLoginP = passw
            break
        else:
            print("[!] Bad password")


    user_id = result['user_profile']['user_id']
    user_token = result['auth_token']
    user_device = client.HEADERS.get("CH-DeviceId")
    write_config(user_id, user_token, user_device, scriptID, AccessCode, WebLoginP,user_phone_number)

    print("[.] Writing configuration file complete.")

    if result['is_waitlisted'] or result['is_onboarding']:

        print("[!] Please sign up from a real device.")
        return
    




if __name__ == "__main__":
    main()