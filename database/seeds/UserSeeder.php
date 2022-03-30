<?php

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = factory(App\User::class,2)->create()->each(function ($user) {
            factory(App\Models\Wallet::class)->create(["user_id"=>$user->id]);
        });
    }
}
