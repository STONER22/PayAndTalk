@echo off
setlocal EnableDelayedExpansion
setlocal EnableExtensions

set settings=./setting.ini
if exist !settings! (
  
  python app.py
) else (
  
  python login.py
)