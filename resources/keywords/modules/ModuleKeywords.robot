*** Settings ***
Library     SeleniumLibrary
# region IFINSYS
Resource    resources/keywords/modules/IFINSYS/OpenIFINSYSKeyword.Robot
Resource    resources/keywords/modules/IFINSYS/OpenIFINSYSKeyword.Robot
# endregion
# region IFINCMS
Resource    resources/keywords/modules/IFINCMS/OpenIFINCMSKeyword.Robot
Resource    resources/keywords/modules/IFINCMS/SidenavIFINCMSKeyword.Robot
# endregion
