<?php
namespace App\Services\User;

use Error;

use App\Models\User;
use App\Traits\ResponseTrait;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Auth;
use App\Repositories\User\UserRepository;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\Repositories\Wallet\WalletRepository;

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
    CONST USER_REGISTRATION_SUCCESSFUL = "Registration Successfully";
    CONST USER_EMAIL_TAKEN = "User email is taken already";
    CONST USER_USERNAME_TAKEN = "User username is taken already";
    CONST USER_NOT_FOUND = "User does not exist/not permitted";
    CONST TOKEN_ERROR = "Could not create token";
    CONST USER_LOGOUT_UNSUCCESSFUL = "User cannot be logged out";
 

    public function __construct(UserRepository $userRepository, WalletRepository $walletRepository)
    {
        $this->userRepository = $userRepository;
        $this->walletRepository = $walletRepository;
    }

    public function login(array $request)
    {
        $user = $this->userRepository->getUserByEmail($request["email"]);
        $token = null;
        if(!is_null($user)){
            if(Auth::attempt(['email'=>$request["email"],'password'=>$request["password"]])){ 
                $credentials = [
                    'email' => $request["email"],
                    'password'=>$request["password"]
                ];
                try {
                    $token = JWTAuth::fromUser($user,$credentials);
                    $result = [
                        'user' => $user,
                        'access_token' => $token,
                        'token_type' => 'bearer',
                        'expires_in' => \Config::get('jwt')['ttl'] * 60
                    ];
                    return $this->success($result,self::USER_LOGIN_SUCCESSFUL,$this->code201);
                } catch (JWTException $e) {
                    return $this->error(self::TOKEN_ERROR,$this->code500);
                }
            }else{
                return $this->error(self::USER_INVALID_CREDENTIALS,$this->code401);
            }
        }else{
                return $this->error(self::USER_NOT_FOUND,$this->code401);
        }
    }

    public function register(array $request)
    {
        $requestData = [
            "email" => $request['email'],
            "password" => bcrypt($request['password']),
            "role" => $request['role'],
            "username" => $request['username']
        ];

        $user = null;

        DB::transaction(function () use ($requestData,&$user) {

            $user = $this->userRepository->create($requestData);

            $walletData = [
                "user_id" => $user->id
            ];
            $user = $this->walletRepository->create($walletData);
            
            }, 3);

            return $this->success($user,self::USER_REGISTRATION_SUCCESSFUL,$this->code201);
    }

    public function logout($request)
    {
        try {
            JWTAuth::invalidate($request->token);
        
            return $this->success(null,self::USER_LOGOUT_SUCCESSFUL,$this->code200);
        } catch (JWTException $exception) {
            return $this->success(null,self::USER_LOGOUT_UNSUCCESSFUL,$this->code500);
           
        }
    
    }

    public function getUserByUsername($username)
    {
        return $this->userRepository->getUserByUsername($username);
    }

    public function getUserByEmail($email)
    {
        return $this->userRepository->getUserByEmail($email);
    }

  



}