<?php
namespace App\Services\Wallet;

use App\Models\Wallet;
use App\Traits\ResponseTrait;
use Illuminate\Support\Facades\DB;
use App\Repositories\User\UserRepository;
use App\Repositories\Wallet\WalletRepository;

class WalletService
{
    use ResponseTrait;
    
    public function __construct(UserRepository $userRepository,WalletRepository $walletRepository)
    {
        $this->walletRepository = $walletRepository;
        $this->userRepository = $userRepository;
    }

    public function fundWallet(array $request)
    {
        $userId = auth()->user()->id; // Auth user
        $fundWallet  = null;

        $fundWalletData = [
            "user_id" => $userId, 
            "balance" => $request['amount']
        ];
        // Check if the user has a wallet already, if not create a default wallet for the user
        $userWallet = $this->walletRepository->getUserWallet($userId);
        if(!$userWallet)
        {
            $fundWallet = $this->walletRepository->create($fundWalletData);
        }
            // If the user does have a wallet already, update his/her balance
            $newBalance =  $request['amount'] + $userWallet['balance'];
            $fundWallet = $this->walletRepository->updateWallet($newBalance,$userId);
            
            return $this->success($fundWallet,Wallet::WALLET_UPDATED,$this->code200);
    }

    public function transferFund(array $request)
    {
        
        $userId = auth()->user()->id; // Auth user
        $transferAmount = floatval($request['amount']);
        $transferRecipientId = $request['user_id']; // Transfer Recipient user;

        $userWallet = $this->walletRepository->getUserWallet($userId); // Auth user check
        $walletAmount = floatval($userWallet['balance']);

        $checkUser = $this->userRepository->getUserById($transferRecipientId);
        // check if the requested user has an account
        if(!$checkUser)
        {
            return $this->error(Wallet::USER_NOT_FOUND,$this->code401);
        }
        // Check if the user has a wallet set up already
        $transferRecipientWallet = $this->walletRepository->getUserWallet($transferRecipientId);
        if(!$transferRecipientWallet){
            return $this->error(Wallet::WALLET_NOT_FOUND,$this->code401);
        }
        if($walletAmount > $transferAmount)
        {

            $newCreditedAmount = floatval($transferRecipientWallet['balance']) + $transferAmount;
            $newDebitedAmount = $walletAmount - $transferAmount;
            $result = null;

            DB::transaction(function () use ($newCreditedAmount,$transferRecipientId,$newDebitedAmount,$userId,&$result) {
                $transferSuccessful = $this->walletRepository->updateWallet($newCreditedAmount,$transferRecipientId);
                $debitedUserSuccessful = $this->walletRepository->updateWallet($newDebitedAmount,$userId);
                
            }, 3);
            $authUserUpdateWallet = $this->walletRepository->getUserWallet($userId);

            $returnArray = [
                "amount_transfered" => $transferAmount,
                "balance" => $authUserUpdateWallet['balance']
            ];
            return $this->success($returnArray,Wallet::WALLET_UPDATED,$this->code200);
        }
            return $this->error(Wallet::INSUFFICIENT_FUNDS,$this->code401);
    }

    public function withdrawFund(array $request)
    {
        $userId = auth()->user()->id;
        $withdrawAmount = floatval($request['amount']);
        $newBalance = null;
        // Check if the user has a wallet already, if not create one for the user
        $userWallet = $this->walletRepository->getUserWallet($userId);
        $walletAmount = floatval($userWallet['balance']);
       
        if(!$userWallet)
        {
            return $this->error(Wallet::WALLET_NOT_FOUND,$this->code401);
        }
         // Check if user has sufficient amount to withdraw
         if($walletAmount > $withdrawAmount)
         {
             $newBalance = $userWallet['balance'] - $withdrawAmount;
             $fundWallet = $this->walletRepository->updateWallet($newBalance,$userId);
             return $this->success($fundWallet,Wallet::WALLET_UPDATED,$this->code200);
         }else
         {
             return $this->error(Wallet::INSUFFICIENT_FUNDS,$this->code401);
         }  
    }
    
}