<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
   //For response messages
   const USER_LOGIN_SUCCESSFUL = 'Login Successful';
   const USER_LOGOUT_SUCCESSFUL = 'Logout Successful';
   const USER_UPDATE_SUCCESSFUL = 'User Update Successful';
   const USER_INVALID_CREDENTIALS = 'Invalid Login Credentials';
   CONST USER_DELETE_SUCCESSFUL="User Deleted Successfully";
   CONST USER_FETCH_SUCCESSFUL="User Fetched Successfully";
   CONST USER_REGISTRATION_SUCCESSFUL = "Registration Successfully";
   CONST USER_NOT_FOUND = "User does not exist/not permitted";
   CONST TOKEN_ERROR = "Could not create token";
   CONST USER_LOGOUT_UNSUCCESSFUL = "User cannot be logged out";

    use Notifiable;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'username', 'email', 'password', 'role',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }
 
    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }
}
