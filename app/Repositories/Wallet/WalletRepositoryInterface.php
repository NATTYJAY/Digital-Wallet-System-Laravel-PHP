<?php 
namespace App\Repositories\Wallet;

interface WalletRepositoryInterface
{
    public function all();

    public function create(array $data);

    public function updateWallet($newBalance, $userId);

    public function delete($id);

    public function show($id);

    public function findWhereIn($column,array $data);

}