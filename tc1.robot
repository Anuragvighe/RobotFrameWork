*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${Browser}  chrome
${url}  https://www.globalsqa.com/angularJs-protractor/BankingProject


*** Test Cases ***
First_testCase
    open browser    ${url}  ${Browser}
    set selenium speed    2

    maximize browser window
    title should be    XYZ Bank

    #Click n customer login
    click element    xpath=//button[contains(text(),'Customer Login')]

    select from list by label    userSelect     Harry Potter
    click element    xpath=//button[contains(text(),'Login')]

Second_testCase
    #check amount
    Chack_Amount

    #click on deposit
    click element    xpath=//button[@ng-class='btnClass2']

    #adding amount
    input text    xpath=//input[@type='number']     10000
    click button    xpath=//button[@type='submit']

    #Rechack Amount
    Chack_Amount

    ${Status}=  get text  xpath=//span[contains(text(),'Deposit Successful')]
    log to console    ${Status}
    close browser



*** Keywords ***
Chack_Amount
    ${Amount}=  get text    //strong[@class='ng-binding'][2]
    log to console    ${Amount}
