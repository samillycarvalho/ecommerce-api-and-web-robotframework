*** Settings ***    
Library    SeleniumLibrary
Library    RequestsLibrary
Library    BuiltIn
Library    Collections
Library    YAML
Library    OperatingSystem
Library    ../support//python_files/dotenv_loader.py
Library    ../tests/venv/lib/python3.13/site-packages/robot/libraries/String.py
Library    ../tests/venv/lib/python3.13/site-packages/robot/libraries/XML.py

Resource    robot_files/elements.resource
Resource    robot_files/environment.resource
Resource    robot_files/elements.resource
Resource    robot_files/variables.resource

Resource    ../utils/headers.resource
Resource    ../utils/keywords_serverest.resource
Resource    ../utils/keywords_front.resource

# BODY
Resource    ../utils/body/login_body.resource
Resource    ../utils/body/user_body.resource
Resource    ../utils/body/product_body.resource
Resource    ../utils/body/carts_body.resource


Resource    ../tests/serverest//api/carts/carts_keyword.resource