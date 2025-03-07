<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Laravel\Passport\Http\Controllers\AccessTokenController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\TimesheetController;
use App\Http\Controllers\AttributeController;
use App\Http\Controllers\ProjectAttributeController;

//  Authentication Routes

// Auth Routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:api');

//  OAuth Token Route
Route::post('/oauth/token', [AccessTokenController::class, 'issueToken'])
    ->middleware(['throttle'])
    ->name('passport.token');

// Protect Authenticated User Route
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// User CRUD Routes
Route::middleware('auth:api')->group(function () {
    Route::apiResource('users', UserController::class)->except(['create', 'edit', 'store']);
});

// Project CRUD & Filtering
Route::middleware('auth:api')->group(function () {
    Route::apiResource('projects', ProjectController::class);
    Route::get('/projects/filter', [ProjectController::class, 'filter']); // Filtering Support
});

// Timesheet CRUD
Route::middleware('auth:api')->group(function () {
    Route::apiResource('timesheets', TimesheetController::class);
});

// Attributes CRUD
Route::middleware('auth:api')->group(function () {
    Route::apiResource('attributes', AttributeController::class);
});

// Project Attribute Handling (EAV)
Route::middleware('auth:api')->group(function () {
    Route::get('/projects/{project}/attributes', [ProjectAttributeController::class, 'show']);
    Route::post('/projects/{project}/attributes', [ProjectAttributeController::class, 'setAttributes']);
});

Route::get('/debug-api', function () {
    return response()->json(['message' => 'API is working']);
});
