<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Wallet extends Model
{
    CONST WALLET_UPDATED = "Transaction successful";
    CONST WALLET_NOT_FOUND = "Users wallet not found";
    CONST INSUFFICIENT_FUNDS = "Insufficient funds";
    CONST USER_NOT_FOUND = "User does not exist/not permitted";
    
    protected $fillable = [
        'user_id'
    ];
    protected $table = "wallet";

}
