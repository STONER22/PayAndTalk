<!-- https://github.com/kirillkuzin/donatehouse/blob/master/README.md -->
# 👋 PayAndTalk
The service launches a bot that adds to the [Clubhouse](https://www.joinclubhouse.com) rooms of people who have donated to you.

Used [clubhouse-py](https://github.com/stypr/clubhouse-py)

Right now, work with:
- [ ] Yandex Money
- [ ] Paypal
- [ ] Qiwi wallet
for [donation alerts](https://www.donationalerts.com/).

## ⚠️ Attention ⚠️
**You use this service at your own risk and should understand 
that your account may be blocked.**

## Usage
You must have a verified account that has passed the procedure 
for joining the Clubhouse (via an invite).

To get started, create a Clubhouse room from your primary account.
After that, open http://localhost:8080/ and enter invite url and set a moderator permission to bot

### Run
1. Clone this repository
2. Setup virtual environment, if you need
3. Install dependencies `pip install -r requirements.txt`
4. Run start.sh or start.bat (Linux&Windows)

### Setup
1. Go to http://localhost:8080/ in your browser
2. Enter the phone number from your account 
(**you must have an access to this phone number**)
3. After redirect, enter the confirmation code that will be sent in the SMS
4. Enter the room id (you can find it in the share link)
5. Enter the language that the robot will speak (ru, en, etc.)
6. After redirect, enter the application id and application secret 
from your donation alerts application
(you can find it [here](https://www.donationalerts.com/application/clients))
7. Log in to donation alerts if need it
8. Now you can invite your user to become a speaker. After a while, he will 
accept the invitation and you will be able to accept donations via your 
donation link

For reset configuration, delete the file "donatehouse/setting.ini".
Also you can edit this file for faster setup.

## ❤️ Help

The most useful pull requests will be UI-altering ones, but the repository 
is open to any help.

<!-- https://github.com/kirillkuzin/donatehouse/blob/master/README.md -->
