<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Wallet;
use Faker\Generator as Faker;

$factory->define(Wallet::class, function (Faker $faker,$data=[]) {
    return [
        "user_id"=>isset($data["user_id"]) ?$data["user_id"]: 1,
        "balance"=>isset($data["amount"]) ?$data["amount"]:0
    ];
});
