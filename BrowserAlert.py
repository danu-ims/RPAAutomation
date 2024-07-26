import pyautogui
import os

try:
    location = pyautogui.locateCenterOnScreen('D:\\RPA\\project3\\images\\chromealert\\ChromeLoginAlert.PNG')
    if location is None:
        raise FileNotFoundError('ImageNotFoundException: image not found')
    print(location)
except FileNotFoundError as e:
    print(e)
