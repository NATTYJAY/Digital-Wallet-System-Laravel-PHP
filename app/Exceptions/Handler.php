<?php

namespace App\Exceptions;

use Exception;
use App\Traits\ResponseTrait;
use Illuminate\Database\QueryException;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Contracts\Encryption\DecryptException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\Eloquent\MassAssignmentException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\Exception\UnauthorizedHttpException;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;

class Handler extends ExceptionHandler
{
    CONST ERROR_CODE = 401;
    use ResponseTrait;
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Report or log an exception.
     *
     * @param  \Exception  $exception
     * @return void
     */
    public function report(Exception $exception)
    {
        parent::report($exception);
    }
    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $exception
     * @return \Illuminate\Http\Response
     */
    public function render($request, Exception $exception)
    {
        if ($exception instanceof UnauthorizedHttpException) 
        {
           
             $preException = $exception->getPrevious();

            if ($preException instanceof \Tymon\JWTAuth\Exceptions\TokenExpiredException)
            {
                return response()->json(['error' => 'Token Expired'], self::ERROR_CODE);
            }
            else if ($preException instanceof \Tymon\JWTAuth\Exceptions\TokenInvalidException)
            {

                return response()->json(['error' => 'Token Invalid'], self::ERROR_CODE);
            }
            else if ($preException instanceof \Tymon\JWTAuth\Exceptions\TokenBlacklistedException) 
            {

                return response()->json(['error' => 'Token Blacklisted'], self::ERROR_CODE);
            }
        }

        if ($exception->getMessage() === 'Token not provided')
        {
            return response()->json(['error' => 'Token not provided'], self::ERROR_CODE);
        }
        if ($exception instanceof MethodNotAllowedHttpException) 
        {
            return $this->error('The specified method for the request is invalid', $this->code405);
        }

        if ($exception instanceof NotFoundHttpException) 
        {
            return $this->error('The specified URL cannot be found', $this->code404);
        }

        if ($exception instanceof ModelNotFoundException) 
        {
            return $this->error('The specified model cannot be found', $this->code404);
        }

        if($exception instanceof AuthenticationException)
        {
            return $this->error($exception->getMessage(), $this->code401);
        }

        if($exception instanceof DecryptException)
        {
            return $this->error($exception->getMessage(), $this->code422);
        }

        if($exception instanceof MassAssignmentException)
        {
            return $this->error($exception->getMessage(), $this->code500);
        }

        if($exception instanceof QueryException)
        {
            return $this->error($exception->getMessage(), $this->code500);
        }
        
        if ($exception instanceof Exception) 
        {
            $message = $exception->getMessage();
            $messageArray = json_decode($message, true);
            // set the pointer to point to the first element
            reset($messageArray);
            $first = current($messageArray);
            // Get first validation error message
            $error = $first[0];

            return $this->error($error, $this->code404);
        }
            return parent::render($request, $exception);
    }
}
