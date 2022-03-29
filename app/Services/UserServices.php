<?php

use App\Traits\ResponseTrait;

class UserService
{

    use ResponseTrait;

    //For response messages
    const USER_LOGIN_SUCCESSFUL = 'Login Successful';
    const USER_LOGIN_UNSUCCESSFUL = 'Login Unsuccessful';
    const USER_LOGOUT_SUCCESSFUL = 'Logout Successful';
    const USER_PASSWORD_RESET_SUCCESSFUL = 'Password Reset Successful';
    const USER_UPDATE_SUCCESSFUL = 'User Update Successful';
    const USER_INVALID_CREDENTIALS = 'Invalid Login Credentials';
    const USER_CANT_CHANGE_STATUS = 'User Can Not Change Status';
    const USER_CANT_CHANGE_EMAIL = 'User Can Not Change Email';
    const USER_CANT_VERIFY_PROFILE = 'User Can Not Verify Profile';
    const USER_CANT_VIEW_PROFILE = 'User Can Not View Profile - Unauthorized';
    CONST USER_FETCH_SUCCESSFUL="User Fetched Successfully";
    CONST COUNT_FETCH_SUCCESSFUL = "Count Fetched Successfully";

}