''' 
ProcessMedic Client Dashboard Backend Functionality
    - Testing some backend logic. Implementation in Python. 
'''
import os as shell
import time 
# variables
PM_BACKEND = "ProcessMedic Client Dashboard" 
OPT_CONFIRM = "Select an option from the menu: "
# arch specifics: 
ARCH_SERVER = "Arch Linux"
ARCH_DETECT_COMM = "which pacman" 
ARCH_UPDATE_COMM = "sudo pacman -Syu" 
# ubuntu specifics: 
UBUNTU_SERVER = "Ubuntu Linux"
UBUNTU_DETECT_COMM = "which apt" 
UBUNTU_UPDATE_COMM = "sudo apt-get update -y && sudo apt-get upgrade -y" 
# functions (non-specific): 
def halt():
    systemSleep = "sleep 1" 
    shell.command(systemSleep)
def welcomeWinTime():
    currTime = time.New()
    print(PM_BACKEND)
    halt()
    print(f'The current time is {currTime}.')
    halt()
def detectOS(det_OS):
    # function to detect the current server OS
# functions (arch-specific): 
def updateArch():
	# will run when user needs to update the Arch server
# functions (ubuntu-specific): 
def updateUbuntu():
	# will run when user needs to update the Ubuntu server

