<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\KomisiController;
use App\Http\Controllers\PembayaranController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\TransaksiController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('/komisi', [KomisiController::class, 'index']);
Route::get('/keuntungan', [KomisiController::class, 'omzet']);
Route::get('/pembayarans', [PembayaranController::class, 'index']);
Route::get('/pembayarans/{id}', [PembayaranController::class, 'show']);
Route::post('/pembayarans', [PembayaranController::class, 'store']);
Route::put('/pembayarans/{id}', [PembayaranController::class, 'update']);
Route::delete('/pembayarans/{id}', [PembayaranController::class, 'destroy']);


Route::get('/index', [CustomerController::class, 'index']);
Route::get('/show/{id}', [CustomerController::class, 'show']);
Route::post('/store', [CustomerController::class, 'store']);
Route::put('/update/{id}', [CustomerController::class, 'update']);
Route::delete('/destroy/{id}', [CustomerController::class, 'destroy']);


Route::post('/store', [TransaksiController::class, 'store']);