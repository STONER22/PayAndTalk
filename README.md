<!-- https://github.com/kirillkuzin/donatehouse/blob/master/README.md -->
# 👋 PayAndTalk
![GitHub top language](https://img.shields.io/github/languages/top/gornostay25/PayAndTalk) ![GitHub](https://img.shields.io/github/license/gornostay25/PayAndTalk) ![Status](https://img.shields.io/static/v1?label=Status&message=Development&color=important&style=flat) [![GitHub last commit](https://img.shields.io/github/last-commit/gornostay25/PayAndTalk)](https://github.com/gornostay25/PayAndTalk/commits/main)

The service launches a bot that adds to the [Clubhouse](https://www.joinclubhouse.com) room of people who have donated to you.

Used:
- [clubhouse-py](https://github.com/stypr/clubhouse-py)
- [objDB](https://googlescripts.harryonline.net/objdb)

Now working with:
- [ ] [Fondy](https://fondy.io/en/)
- [ ] Paypal
- [ ] Qiwi wallet

## ⚠️ Attention ⚠️
**You use this service at your own risk. You have to understand
that your account may be blocked.**

## Usage

[![GitHub Repo stars](https://img.shields.io/github/stars/gornostay25/PayAndTalk?style=social)](https://github.com/gornostay25/PayAndTalk/stargazers) [![GitHub watchers](https://img.shields.io/github/watchers/gornostay25/PayAndTalk?style=social)](https://github.com/gornostay25/PayAndTalk/watchers)


***You must have a verified account that has been registered and authorized
Clubhouse (by invitation).***

To get started, create a Clubhouse room from your *main account*. <br>
Then open http://localhost:8080 <br>
  and enter the URL of the room <br>
then add the bot as the **moderator** of the room.

### Setup
1. Clone this repository or download the archive from the [releases](https://github.com/gornostay25/PayAndTalk/releases) tab
2. Setup virtual environment, if you need
3. Install dependencies `pip install -r requirements.txt`
4. Install and configure GATEWAY ([instruction](/docs/EN/GAS.md))
5. Run the script start.sh (Unix) або start.bat (Windows)
    * at firt 
      1. Enter the phone number from your account
      8. Then enter the confirmation code that will be sent in the SMS
      9. Enter the address of the [GATEWAY](/docs/EN/GAS.md) script
      10. Enter the [access code](/docs/EN/GAS.md) to GATEWAY
      11. Come up with a password to access the program


### Run


1. When the configuration is complete, run the script again `start.sh` (Unix) or `start.bat` (Windows)
2. Then open http://localhost:8080
3. [Instructions for use](/docs/EN/USE.md)


To reset the configuration, delete the file " `PayAndTalk/setting.ini` ".
You can also edit this file for quick setup.

## ❤️ Help and support

The most useful pull requests will be UI-altering ones, but the repository 
is open to any help.


## Languages

EN / [RU](/docs/RU/README.md) / [UK](/docs/UK/README.md) / [ME](/docs/ME/README.md)
<!-- https://github.com/kirillkuzin/donatehouse/blob/master/README.md -->
