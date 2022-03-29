<?php
namespace App\Services\Wallet;

use App\Traits\ResponseTrait;
use App\Repositories\Wallet\WalletRepository;

class UserService
{
    use ResponseTrait;

    public function __construct(WalletRepository $walletRepository)
    {
        $this->walletRepository = $walletRepository;
    }


    
}