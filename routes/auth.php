<?php
use Laravel\Passport\Http\Controllers\AccessTokenController;
use Laravel\Passport\Http\Controllers\AuthorizationController;
use Laravel\Passport\Http\Controllers\ClientsController;
use Laravel\Passport\Http\Controllers\PersonalAccessTokenController;
use Laravel\Passport\Http\Controllers\ScopesController;
use Laravel\Passport\Http\Controllers\TransientTokenController;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => ['api']], function () {
    Route::post('/oauth/token', [AccessTokenController::class, 'issueToken'])
        ->middleware(['throttle']);

    Route::get('/oauth/authorize', [AuthorizationController::class, 'authorize']);
    Route::post('/oauth/authorize', [AuthorizationController::class, 'approve']);
    Route::delete('/oauth/authorize', [AuthorizationController::class, 'deny']);
    
    Route::resource('/oauth/clients', ClientsController::class)
        ->only(['index', 'store', 'update', 'destroy']);
    
    Route::resource('/oauth/personal-access-tokens', PersonalAccessTokenController::class)
        ->only(['index', 'store', 'destroy']);

    Route::get('/oauth/scopes', [ScopesController::class, 'all']);
    Route::post('/oauth/token/refresh', [TransientTokenController::class, 'refresh']);
});
