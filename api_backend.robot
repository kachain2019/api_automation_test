*** Settings ***
Library           Selenium2Library
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary

*** Variables ***

*** Keywords ***
# QA Automation Test โจทย์นะจ๊ะ
# Please design test case and write automation code to test web service. Try your best to test
# with high quality code.
# 1. Write test script to execute test the API (GET Method) by Newman.
# URL: https://jsonplaceholder.typicode.com/todos

# 2. Write test script to execute test the API (POST Method) with assertions by Newman.
# URL: http://httpbin.org/post
# Assertions:
# - HTTP Status code
# - Response Header

# 3. Write test script to execute test the API with Basic Authentication by Newman.
# URL: http://httpbin.org/basic-auth/user/pass
# User: user
# Password: pass

# 4. How to stop Newman when any assertion fails?

# 5. Write test script to execute API (GET Method) with Robot Framework.
# URL: https://jsonplaceholder.typicode.com/users
# Assertions:
# - HTTP Status code
# - Response Return type
# - Response Data type
# - Response Data size
# 6. Write test script to execute API (POST Method) with Robot Framework.
# URL: https://jsonplaceholder.typicode.com/posts
# Assertions:
# - HTTP Status code
# - Response Header ดึงข้อมูลมาได้ไม่มีส่วนนี้

*** Test Cases *** 
1. Write test script to execute test the API (GET Method) by Newman.
   Create Session    Newman    https://jsonplaceholder.typicode.com
   ${response}     Get Request      Newman    /todos
   Log To Console  ${response.json()}
2. Write test script to execute test the API (POST Method) with assertions by Newman.
   Create Session    Newman    http://httpbin.org
   ${response}     POST Request      Newman    /post
   Log To Console  ${response.json()}\n
   Log To Console  ${response.status_code}\n
   Log To Console  ${response.json()}[headers]\n
3. Write test script to execute test the API with Basic Authentication by Newman.
   ${body}    Create Dictionary    User=user    Password=pass
   Log To Console   ${body} 
   Create Session    Newman    http://httpbin.org/basic-auth
   ${response}     POST Request      Newman    /user/pass    data=${body}
   Log To Console  ${response.json()}\n
4. How to stop Newman when any assertion fails?
     robot --exitonfailure .\api_backend.robot
5. Write test script to execute API (GET Method) with Robot Framework.
   Create Session    Newman    https://jsonplaceholder.typicode.com
   ${response}     Get Request      Newman    /users
   Log To Console  ${response.json()}\n
   Log To Console  ${response.status_code}\n
   ${return_type}    Evaluate      type($response).__name__ 
   Log To Console   ${return_type}\n
   ${data_type}    Evaluate     type(${response.json()}).__name__ 
   Log To Console   ${data_type}\n
   ${data_size}    Evaluate    len(${response.json()})
   Log To Console   \n\n${data_size}\n
6. Write test script to execute API (POST Method) with Robot Framework.
   Create Session    Newman    https://jsonplaceholder.typicode.com
   ${response}     POST Request      Newman    /posts
   Log To Console  ${response.status_code}\n
   Log To Console  ${response.json()}\n


