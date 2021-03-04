settings="./setting.ini"
if [ -e "$settings" ]; then
  exec python app.py
  
else
  exec python login.py
  
fi