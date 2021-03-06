<?php 
namespace App\Repositories\User;

interface UserRepositoryInterface
{
    public function all();

    public function create(array $data);

    public function update(array $data, $id);

    public function delete($id);

    public function show($id);

    public function findWhereIn($column,array $data);

    public function getUserByUsername($username);

    public function getUserByEmail($email);
}