<?php

use App\Helper\Wablas;
use App\Http\Controllers\AboutController;
use App\Http\Controllers\ChangePasswordController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProgramController;
use App\Http\Controllers\ArtikelController;
use App\Http\Controllers\Auth\VerificationController;
use App\Http\Controllers\FAQController;
use App\Http\Controllers\TransController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TransactionController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes(['verified' => true]);

Route::get('/test', function () {
    return view('frontend.pages.home');
});

Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('/campaign', [ProgramController::class, 'index'])->name('campaign.index');
Route::get('/campaign/search', [ProgramController::class, 'search'])->name('campaign.search');
Route::get('/campaign/category/{name}', [ProgramController::class, 'category'])->name('campaign.category');
Route::get('/campaign/{name}', [ProgramController::class, 'show'])->name('campaign.show');

Route::get('/cek-invoice', [InvoiceController::class, 'index'])->name('invoice.index');
Route::post('/cek-invoice', [InvoiceController::class, 'check'])->name('invoice.check');

Route::get('/artikel', [ArtikelController::class, 'index'])->name('artikel.index');
Route::get('/artikel/search', [ArtikelController::class, 'search'])->name('artikel.search');
Route::get('/artikel/{name}', [ArtikelController::class, 'detail'])->name('artikel.show');

Route::get('/about', [AboutController::class, 'index'])->name('about');

Route::get('/faq', [FAQController::class, 'index'])->name('faq');

Route::get('/trans', [TransController::class, 'index'])->name('trans');

// donatur login
Route::middleware('auth')->group(function () {

    Route::get('/email/verify', [VerificationController::class, 'show'])->name('verification.notice');
    Route::get('/email/verify/{id}/{hash}', [VerificationController::class, 'verify'])->name('verification.verify')->middleware(['signed']);
    Route::post('/email/resend', [VerificationController::class, 'resend'])->name('verification.resend');

    Route::middleware('verified')->group(function () {
        Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
        Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');
        Route::get('/donate', [TransactionController::class, 'index'])->name('transaction.index');
        Route::get('/change-password', [ChangePasswordController::class, 'index'])->name('change-password.index');
        Route::post('/change-password', [ChangePasswordController::class, 'update'])->name('change-password.update');
    });
});

Route::get('/test-wa', function () {
    Wablas::sendAdmin(24);
});


Route::post('donate', [TransactionController::class, 'donate'])->name('donate');
Route::get('donate/{slug}', [TransactionController::class, 'payment'])->name('donate.payment');

Route::get('success/{token}', [TransactionController::class, 'success'])->name('success');

Route::post('/get-payment', [PaymentController::class, 'get'])->name('payments.get');

Route::post('/create-payment', [TransactionController::class, 'createPayment'])->name('create-payment');
