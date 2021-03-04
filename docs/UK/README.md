<!-- https://github.com/kirillkuzin/donatehouse/blob/master/README.md -->
# 👋 PayAndTalk
![GitHub top language](https://img.shields.io/github/languages/top/gornostay25/PayAndTalk) ![GitHub](https://img.shields.io/github/license/gornostay25/PayAndTalk) ![Status](https://img.shields.io/static/v1?label=Status&message=Development&color=important&style=flat) [![GitHub last commit](https://img.shields.io/github/last-commit/gornostay25/PayAndTalk)](https://github.com/gornostay25/PayAndTalk/commits/main)

Служба запускає бота, який додає до [Clubhouse](https://www.joinclubhouse.com) кімнати людей, які пожертвували вам.

Використовуються:
- [clubhouse-py](https://github.com/stypr/clubhouse-py)
- [objDB](https://googlescripts.harryonline.net/objdb)

Зараз працює з:
- [ ] [Fondy](https://fondy.ua/uk/)
- [ ] Paypal
- [ ] Qiwi wallet

## ⚠️ Увага ⚠️
**Ви користуєтесь цією послугою на свій страх та ризик. Ви повинні  зрозуміти
що ваш обліковий запис може бути заблокований.**

## Використвння

[![GitHub Repo stars](https://img.shields.io/github/stars/gornostay25/PayAndTalk?style=social)](https://github.com/gornostay25/PayAndTalk/stargazers) [![GitHub watchers](https://img.shields.io/github/watchers/gornostay25/PayAndTalk?style=social)](https://github.com/gornostay25/PayAndTalk/watchers)


***Ви повинні мати підтверджений обліковий запис, який пройшов реєстрацію та авторизацію
 Clubhouse (через запрошення).***


Для початку створіть кімнату Clubhouse зі свого *основного облікового запису*.<br>
Після цього відкрийте http://localhost:8080 <br>
 і введіть URL-адресу кімнати<br>
після цього додайте бота як **модератора** кімнати.


### Налаштування
1. Клонуйте це сховище або завантажте архів з вкладки [releases](https://github.com/gornostay25/PayAndTalk/releases)
2. Налаштуйте віртуальне середовище, якщо потрібно
3. Встановіть залежності `pip install -r requirements.txt`
4. Встановіть та налаштуйте GATEWAY ([інструкція](/docs/UK/GAS.md))
5. Запустіть скрипт 
start.sh (Unix) 
або start.bat (Windows)
   * #### При першому запуску
      1. Введіть номер телефону зі свого облікового запису
      2. Потім введіть код підтвердження, який буде надіслано в SMS
      3. Введіть адресу [GATEWAY](/docs/UK/GAS.md) скрипту
      4. Введіть [код доступу](/docs/UK/GAS.md) до GATEWAY
      5. Придумайте пароль для доступу до програми



### Запуск

1. Після завершення налаштування ще раз запустіть скрипт 
`start.sh` (Unix) 
або `start.bat` (Windows)
2. Потім відкрийте http://localhost:8080
3. [Інструкція по використанню](/docs/UK/USE.md)


> Для скидання конфігурації видаліть файл "PayAndTalk / setting.ini".
> Також ви можете відредагувати цей файл для швидшого налаштування.

## ❤️ Допомога та підтримка

The most useful pull requests will be UI-altering ones, but the repository 
is open to any help.


## Мови

[EN](/README.md) / [RU](/docs/RU/README.md) / UK / [ME](/docs/ME/README.md)
<!-- https://github.com/kirillkuzin/donatehouse/blob/master/README.md -->
