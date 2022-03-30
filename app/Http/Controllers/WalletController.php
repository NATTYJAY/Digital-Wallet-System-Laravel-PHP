<?php

namespace App\Http\Controllers;

use App\Services\Wallet\WalletService;
use App\Http\Requests\Wallet\WalletRequest;
use App\Http\Requests\Wallet\TransferFundRequest;

class WalletController extends Controller
{
    protected $WalletService;

    public function __construct(WalletService $WalletService)
    {
        $this->walletService = $WalletService;
    }

    public function fundWallet(WalletRequest $request)
    {
        return $this->walletService->fundWallet($request->all());
    }

    public function transferFund(TransferFundRequest $request)
    {
        return $this->walletService->transferFund($request->all());
    }

    public function withdrawFund(WalletRequest $request)
    {
        return $this->walletService->withdrawFund($request->all());
    }
}
