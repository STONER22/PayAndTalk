from clubhouse.clubhouse import Clubhouse
import configparser

def write_config(user_id, user_token, user_device, filename='setting.ini'):
    """ (str, str, str, str) -> bool
    Write Config. return True on successful file write
    """
    config = configparser.ConfigParser()
    config["Account"] = {
        "user_device": user_device,
        "user_id": user_id,
        "user_token": user_token,
    }
    with open(filename, 'w') as config_file:
        config.write(config_file)
    return True

def main():
    client = Clubhouse()+
    result = None
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

    user_id = result['user_profile']['user_id']
    user_token = result['auth_token']
    user_device = client.HEADERS.get("CH-DeviceId")
    write_config(user_id, user_token, user_device)

    print("[.] Writing configuration file complete.")

    if result['is_waitlisted'] or result['is_onboarding']:
        print("[!] Please sign up from a real device.")
        return
    

    print("[.] Login complete")


if __name__ == "__main__":
    main()