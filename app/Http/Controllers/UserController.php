<?php

namespace App\Http\Controllers;

use App\Services\User\UserService;
use App\Http\Requests\User\LoginRequest;
use App\Http\Requests\User\LogoutRequest;
use App\Http\Requests\User\UpdateRequest;
use App\Http\Requests\User\RegisterRequest;

class UserController extends Controller
{
    protected $UserService;

    public function __construct(UserService $UserService)
    {
        $this->userService = $UserService;
    }
    
    public function register(RegisterRequest $request)
    {
        return $this->userService->register($request->all());
    }

    public function login(LoginRequest $request)
    {
        return $this->userService->login($request->all());
    }

    public function logout(LogoutRequest $request)
    {
        return $this->userService->logout($request->all());
    }

    public function get()
    {
        return $this->userService->get();
    }

    public function update(UpdateRequest $request, $id)
    {
        return $this->userService->update($request->all(), $id);
    }

    public function delete()
    {
        return $this->userService->delete();
    }
}