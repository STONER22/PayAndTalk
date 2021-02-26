<!-- https://github.com/kirillkuzin/donatehouse/blob/master/README.md -->
# 👋 PayAndTalk
Служба запускает бота, который добавляет в [Clubhouse](https://www.joinclubhouse.com) комнаты людей, которые сделали вам пожертвования.

Использует [clubhouse-py](https://github.com/stypr/clubhouse-py)<br>
и [objDB](https://googlescripts.harryonline.net/objdb)

Работает с:
- [ ] Yandex Money
- [ ] Paypal
- [ ] Qiwi wallet

## ⚠️ Attention ⚠️
**You use this service at your own risk and should understand 
that your account may be blocked.**

## Usage
You must have a verified account that has passed the procedure 
for joining the Clubhouse (via an invite).

To get started, create a Clubhouse room from your primary account.
After that, open http://localhost:8080 and enter room url (you can find it in the share link) 
after add bot as a room moderator.


### Run
1. Clone this repository
2. Setup virtual environment, if you need
3. Install dependencies `pip install -r requirements.txt`
4. Run start.sh or start.bat (Unix & Windows)

### Setup
1. Go to project folder and start login.py file.
2. Enter the phone number from your account 
(**you must have an access to this phone number**)
3. After redirect, enter the confirmation code that will be sent in the SMS
4. Enter the Google Sheet url (See [Setup GAS.md](GAS_RU.md))
5. Enter the password to access to dashboard


For reset configuration, delete the file "PayAndTalk/setting.ini".
Also you can edit this file for faster setup.

## ❤️ Help

The most useful pull requests will be UI-altering ones, but the repository 
is open to any help.

<!-- https://github.com/kirillkuzin/donatehouse/blob/master/README.md -->
