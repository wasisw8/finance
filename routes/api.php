<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\WalletApiController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\JenisPenerimaanController;
use App\Http\Controllers\Api\JenisPengeluaranController;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:api')->group(function () {
    Route::get('/me', [AuthController::class, 'me']);
    Route::post('/logout', [AuthController::class, 'logout']);

    Route::group(['prefix' => 'wallet'], function () {
        Route::get('', [WalletApiController::class, 'index']);
        Route::post('/store', [WalletApiController::class, 'store']);
        Route::get('/show', [WalletApiController::class, 'show']);
        Route::post('/update', [WalletApiController::class, 'update']);
        Route::post('/destroy', [WalletApiController::class, 'destroy']);
    });

    Route::prefix('penerimaan-jenis')->group(function () {
        Route::get('/', [JenisPenerimaanController::class, 'index']);
        Route::post('/store', [JenisPenerimaanController::class, 'store']);
        Route::get('/show', [JenisPenerimaanController::class, 'show']);
        Route::post('/update', [JenisPenerimaanController::class, 'update']);
        Route::post('/destroy', [JenisPenerimaanController::class, 'destroy']);
    });
    Route::prefix('pengeluaran-jenis')->group(function () {
        Route::get('/', [JenisPengeluaranController::class, 'index']);
        Route::post('/store', [JenisPengeluaranController::class, 'store']);
        Route::get('/show', [JenisPengeluaranController::class, 'show']);
        Route::post('/update', [JenisPengeluaranController::class, 'update']);
        Route::post('/destroy', [JenisPengeluaranController::class, 'destroy']);
    });
});

Route::get('/ping', function () {
    return response()->json(['pong' => true]);
});
