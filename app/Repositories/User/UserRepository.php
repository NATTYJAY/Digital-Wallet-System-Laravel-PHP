<?php 

namespace App\Repositories\User;

use App\User;


class UserRepository implements UserRepositoryInterface
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct()
    {
        $this->model = new User();
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
        return User::create($data);
    }

    // update record in the database
    public function update(array $data, $id)
    {
        $model = $this->model->find($id);
        $model->update($data);
        return $model;
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

    public function getUserById($id)
    {
        return User::where('id', $id)->first();
    }

    public function getUserByUsername($username)
    {
        return User::where('username', $username)->first();
    }

    public function getUserByEmail($email)
    {
        return User::where('email', $email)->first();
    }
}