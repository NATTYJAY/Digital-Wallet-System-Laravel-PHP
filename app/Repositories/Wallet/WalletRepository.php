<?php 

namespace App\Repositories\Wallet;

use App\Models\Wallet;
use App\Repositories\Wallet\WalletRepositoryInterface;


class WalletRepository implements WalletRepositoryInterface
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct()
    {
        $this->model = new Wallet();
    }

    // Get all instances of model
    public function all()
    {
        return $this->model->latest()->get();
    }
    // create a new record in the database
    // Create register also user's wallet here.
    public function create(array $data)
    {
        return Wallet::create($data);
    }

    // update record in the database
    public function updateWallet($newBalance, $userId)
    {
        $model = Wallet::where('user_id', '=', $userId);
        $updated =  $model->update(['balance' => $newBalance]);
        return $updated;
    }

    // remove record from the database
    public function delete($id)
    {
        return $this->model->destroy($id);
    }

    // show the record with the given id
    public function show($id)
    {
        return $this->model->findOrFail($id);
    }

    public function findWhereIn($column,$data)
    {
        return $this->model->whereIn($column,$data);
    }

    public function getUserWallet($userId)
    {
        return Wallet::where("user_id", $userId)->first();
    }

   
}