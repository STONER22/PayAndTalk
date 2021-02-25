from clubhouse.clubhouse import Clubhouse
import configparser,re

def write_config(user_id, user_token, user_device, sheet_id, dashboard_pass, phone_number, filename='setting.ini'):
    """ (str, str, str, str, str, str, str) -> bool
    Write Config. return True on successful file write
    """
    config = configparser.ConfigParser()
    config["Account"] = {
        "user_device": user_device,
        "user_id": user_id,
        "user_token": user_token,
        "sheet_id":sheet_id,
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

    sheetID = None
    while 1:
        regex = r"https:\/\/docs\.google\.com\/spreadsheets\/d\/(.*)\/"
        sheetURL = input("[.] Please enter Google sheet url (https://docs.google.com/spreadsheets/d/.../edit) > ")
        x = re.search(regex, sheetURL)
        if(x[1]):
            sheetID = x[1]
            break
        else:
            print("[!] Bad URL format")
    WebLoginP=None
    while 1:
        passw = input("[.] Please enter web dashboard login password > ")
      
        if(passw):
            WebLoginP = passw
            break
        else:
            print("[!] Bad password")


    user_id = result['user_profile']['user_id']
    user_token = result['auth_token']
    user_device = client.HEADERS.get("CH-DeviceId")
    write_config(user_id, user_token, user_device, sheetID, WebLoginP,user_phone_number)

    print("[.] Writing configuration file complete.")

    if result['is_waitlisted'] or result['is_onboarding']:
        
        print("[!] Please sign up from a real device.")
        return
    




if __name__ == "__main__":
    main()