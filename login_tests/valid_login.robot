*** Settings ***
Documentation     A test suite with a single test for valid login. This test has
...               a workflow that is created using keywords from the resource file.
Metadata          Application Name    BookStore
Resource          resource.robot

*** Test Cases ***
Valid Login
    [Documentation]    This test case covers login with a valid username & password
    [Tags]    Login    Functional
    [Setup]    Open Browser To Login Page
    Login With Valid Credentials    ${VALID USER}    ${VALID PASSWD}
    Submit Credentials
    Take Snapshot    myimage.jpg
    log    valid login test passed and snapshot is saved
    [Teardown]    Close Browser

Invalid Login
    [Documentation]    This test case covers login with an invalid username and password
    Open Browser To Login Page
    Login With Invalid Credentials    nonadmin    nonadmin
    Submit Credentials
    take snapshot    wrongLogin.jpg
    [Teardown]    Close Browser
