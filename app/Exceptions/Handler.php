<?php

namespace App\Exceptions;

use App\Utils\ApiResponse;
use GuzzleHttp\Exception\ServerException;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Session\TokenMismatchException;
use Illuminate\Support\Facades\Log;
use SebastianBergmann\Invoker\TimeoutException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Throwable;

class Handler extends ExceptionHandler
{
    use ApiResponse;

    /**
     * A list of the exception types that are not reported.
     *
     * @var array<int, class-string<Throwable>>
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        $this->reportable(function (Throwable $exception) {
        });
    }

    protected function unauthenticated($request, AuthenticationException $exception)
    {
        return $request->expectsJson()
            ? response()->json(['message' => 'Unauthenticated.'], 401)
            : redirect()->guest(route('login'));
    }

    public function report(Throwable $exception)
    {
        parent::report($exception);
    }

    public function render($request, Throwable $exception)
    {

        if ($request->ajax()) {
   
            if ($exception instanceof TokenMismatchException) {
                return response()->json(['error' => 'Your form has expired. Please try again'], 419);
            }
            if ($exception instanceof CustomException) {
                return response()->json(['error' => $exception->getMessage()], 400);
            }

        }
        if ($request->is('api/*')) {
            if ($exception instanceof AuthenticationException) {
                return $this->error('Token tidak cocok', 401);

            }if ($exception instanceof TimeoutException) {
                return $this->error('Timeout', 408);
            }
            if ($exception instanceof AuthorizationException) {
                return $this->error('Anda tidak memiliki akses', 401);
            }
            if ($exception instanceof ServerException) {
                return $this->error('Terjadi Masalah pada server', 500);
            }
            if ($exception instanceof TokenMismatchException) {
                return $this->error('Token anda telah kadaluarsa', 419);
            }
            if ($exception instanceof NotFoundHttpException) {
                return $this->error('Endpoint tidak ditemukan', 404);
            }
            if ($exception instanceof ModelNotFoundException) {
                return $this->error('Data Tidak Ditemukan', 404);
            }
        }

        return parent::render($request, $exception);
    }
}
