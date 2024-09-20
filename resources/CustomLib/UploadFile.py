import pyautogui
import pyperclip
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class UploadFile:
    def upload_file_excel(self, file_path):
        """
        Uploads an Excel file by clicking the upload button and handling the file dialog.
        
        :param file_path: Path to the Excel file to be uploaded
        """
        # Click the visible upload button
        upload_button = WebDriverWait(pyautogui.driver, 10).until(
            EC.element_to_be_clickable((By.XPATH, "//button[.//span[contains(text(), 'Upload')]]"))
        )
        upload_button.click()

        # Wait for the file dialog to appear
        time.sleep(1)

        # Paste the file path
        pyperclip.copy(file_path)
        pyautogui.hotkey('ctrl', 'v')
        
        # Press Enter to confirm the file selection
        pyautogui.press('enter')

        # Wait for the upload to complete (you might need to adjust this based on your application's behavior)
        time.sleep(5)

# Robot Framework keywords
def upload_file_excel(file_path):
    UploadFile().upload_file_excel(file_path)