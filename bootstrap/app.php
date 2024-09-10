<?php

use App\Exceptions\ResponseError;
use App\Http\Middleware\CheckUser;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

return Application::configure(basePath: dirname(__DIR__))
   ->withRouting(
      web: __DIR__ . '/../routes/web.php',
      commands: __DIR__ . '/../routes/console.php',
      api: __DIR__ . '/../routes/api.php',
      health: '/up',
   )
   ->withMiddleware(function (Middleware $middleware) {
      $middleware->validateCsrfTokens(except: [
         '/tiny-editor/upload'
      ]);
   })
   ->withExceptions(function (Exceptions $exceptions) {
      

      $exceptions->render(function (MethodNotAllowedHttpException $e, Request $request) {
         return ResponseError::send($request, "Method Not Allowed", 405);
      });

      $exceptions->render(function (NotFoundHttpException $e, Request $request) {
         return ResponseError::send($request, "EndPoint Route NotFound", 401);
      });

      $exceptions->render(function (AuthorizationException $exception, Request $request) {

         return ResponseError::send($request, "Failed unauthorized", 403);
      });

      $exceptions->render(function (AuthenticationException $e, Request $request) {
         return ResponseError::send($request, "Failed Authentication", 401);
      });

      $exceptions->render(function (AccessDeniedHttpException $exception, Request $request) {
         return ResponseError::send($request, "This action is unauthorized", 401);
      });

      $exceptions->render(function (QueryException $exception, Request $request) {
         return ResponseError::send($request, "An error occurred while retrieving data. Please try again later.", 401);
      });

      $exceptions->render(function (TokenMismatchException $exception, Request $request) {
         return ResponseError::send($request, "Your form has expired. Please try again", 419);
      });
      $exceptions->render(function (CustomException $exception, Request $request) {
         return ResponseError::send($request, $exception->getMessage(), 400);
      });
   })
   ->withMiddleware(function (Middleware $middleware) {
      $middleware->alias([
         'role' => \Spatie\Permission\Middleware\RoleMiddleware::class,
         'permission' => \Spatie\Permission\Middleware\PermissionMiddleware::class,
         'role_or_permission' => \Spatie\Permission\Middleware\RoleOrPermissionMiddleware::class,
         'auth_web' => CheckUser::class,
      ]);
   })
   ->create();
