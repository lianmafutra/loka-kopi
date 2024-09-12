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


      $exceptions->render(function (Exception $e, Request $request) {
         if ($request->is('api/*') || $request->ajax()) {
            if ($e instanceof MethodNotAllowedHttpException) {
               return ResponseError::send($request, "Method Not Allowed", 405);
            }

            if ($e instanceof NotFoundHttpException) {
               return ResponseError::send($request, "EndPoint Route NotFound", 404);
            }

            if ($e instanceof AuthorizationException) {
               return ResponseError::send($request, "Failed unauthorized", 403);
            }

            if ($e instanceof AuthenticationException) {
               return ResponseError::send($request, "Failed Authentication", 401);
            }

            if ($e instanceof AccessDeniedHttpException) {
               return ResponseError::send($request, "This action is unauthorized", 401);
            }

            if ($e instanceof QueryException) {
               return ResponseError::send($request, "An error occurred while retrieving data. Please try again later.", 401);
            }

            if ($e instanceof TokenMismatchException) {
               return ResponseError::send($request, "Your form has expired. Please try again", 419);
            }

            if ($e instanceof CustomException) {
               return ResponseError::send($request, $e->getMessage(), 400);
            }
         }
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
