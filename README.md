# README

Problem: Create a Content Management System with authentication and authorisation of admins
where there can be multiple admins with different roles and each role will have different
permissions.

● Role - Administrator
    ○ Can do all CRUD operations for user
    ○ Can do all CRUD operations on Admins and should be able to
    add/update roles also.

● Role - Manager
    ○ Can view a list of users and their details.
    ○ Filter user by name/email or status


● Code coverage for APIs using Rspec.
● Use Active Model Serializers for preparing responses.

* Gem: pundit used for configuring authorization polices and policy scopes
* Gem: devise/devise_token_auth used for authentication (Administrator/Manager)
