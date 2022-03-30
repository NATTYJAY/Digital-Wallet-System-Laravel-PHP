<?php
namespace App\Services\User;

use App\User;
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
                    return $this->success($result,User::USER_LOGIN_SUCCESSFUL,$this->code201);
                } catch (JWTException $e) {
                    return $this->error(User::TOKEN_ERROR,$this->code500);
                }
            }else{
                return $this->error(User::USER_INVALID_CREDENTIALS,$this->code401);
            }
        }else{
                return $this->error(User::USER_NOT_FOUND,$this->code401);
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
            $userWallet = $this->walletRepository->create($walletData);
            
        }, 3);
        return $this->success($user,User::USER_REGISTRATION_SUCCESSFUL,$this->code201);
    }

    public function get()
    {
        $id = auth()->user()->id;
        $user = $this->userRepository->show($id);
        return $this->success($user,User::USER_FETCH_SUCCESSFUL,$this->code200);
    }

    public function update($request)
    {
        $data = $request;
        $id = auth()->user()->id;
        $user = $this->userRepository->update($data, $id);
        return $this->success($user,User::USER_UPDATE_SUCCESSFUL,$this->code201);
    }

    public function logout($request)
    {
        try {
            JWTAuth::invalidate($request['token']);

            return $this->success(null,User::USER_LOGOUT_SUCCESSFUL,$this->code200);
        } catch (JWTException $exception) {

            return $this->error($exception,User::USER_LOGOUT_UNSUCCESSFUL,$this->code500);
        }
    }

    public function delete()
    {
        $id = auth()->user()->id;
        $deletedUser = $this->userRepository->delete($id);
        return $this->success(null,User::USER_DELETE_SUCCESSFUL,$this->code201);
    }

}