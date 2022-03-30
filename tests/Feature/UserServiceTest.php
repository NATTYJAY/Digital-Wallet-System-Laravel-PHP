<?php

// namespace Tests\Feature;

use App\User;
use Tests\TestCase;
use App\Models\Wallet;

class UserServiceTest extends TestCase
{
    
    protected $loginEndPoint = "api/v1/user/login";
    protected $registerEndPoint = "api/v1/user/register";
    protected $retrieveUserEndPoint = "api/v1/user/get";
    protected $updateUserEndPoint = "api/v1/user/update";
    protected $deleteUserEndPoint = "api/v1/user/delete";

    public function setUp():void{
        parent::setUp();
    }

    public function tearDown() : void{

    }

    public function testRegister()
    {
        $faker = Faker\Factory::create();
        $data = [
            "username"=>$faker->asciify('********************'),
            "email"=>$faker->unique()->safeEmail,
            "role"=>"admin",
            "password"=> bcrypt('admin')
        ];
        $response = $this->json('POST', $this->registerEndPoint, $data);
        $response->assertStatus(201);
        return json_decode($response->getContent())->data->id;
    }

    public function testFailureLogin()
    {
        $this->user = factory(User::class)->create();
        $data = [
            "email" =>  $this->user->email,
            "password"=>  "admin1"
        ];
        $response = $this->post($this->loginEndPoint,$data);
        $response->assertStatus(401);
        $response->assertJson(["message" => "Invalid Login Credentials"]);
        $response->assertJson(["status" => "failed"]);

        User::where('email',$this->user->email)->delete();
    }

    public function testSuccessLogin()
    {
        $data = [
            "email" => "test@test.com",
            "password"=> "admin"
        ];
        $response = $this->post($this->loginEndPoint,$data);
        $response->assertStatus(200);
        $response->assertJson(["message" => "Login Successful"]);
        $response->assertJson(["status" => "success"]);
    }

    public function testEmailAlreadyExist()
    {
        $this->user = factory(User::class)->create();
        $data = [
            "email"=> "test@test.com"
        ];
        $response = $this->post($this->registerEndPoint,$data);
        $response->assertStatus(404);
        $response->assertJson(["message" => "The email has already been taken."]);
        $response->assertJson(["status" => "failed"]);
    }

    public function testUserToken()
    {
        $this->user = factory(User::class)->create();
        $wallet = Wallet::create(['user_id'=>$this->user->id,'balance'=>0]);
        $data = ["email"=>$this->user->email,"password"=>"admin"];
        $response = $this->post($this->loginEndPoint,$data);
        $response->assertStatus(200);
        $token = (json_decode($response->getContent())->data->access_token);
        return $token;
    }
    /**
     * 
     * @depends testUserToken
     * 
     */
    public function testFetchUser($token)
    {
        $endpoint = $this->retrieveUserEndPoint;
        $response = $this->json('GET', $endpoint,[], ['Authorization' => "Bearer ".$token]);
        $response->assertStatus(200);
        $response->assertJson(["message" => "User Fetched Successful"]);
        $response->assertJson(["status" => "success"]);
        return json_decode($response->getContent())->data->id;
    }

    /**
     * @depends testUserToken
     * @depends testRegister
     */
    public function testEditUser($token,$id){
        $faker = Faker\Factory::create();
        $endpoint = $this->updateUserEndPoint."/".$id;
        $data = [
            "username"=>$faker->asciify('********************')
        ];
        $response = $this->json('PATCH', $endpoint, $data, ['Authorization' => "Bearer ".$token]); 
        $response->assertJson(["message" => "User Updated Successful"]);
        $response->assertJson(["status" => "success"]);
        $response->assertStatus(201);
    }

}
