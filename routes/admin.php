<?php

use App\Http\Controllers\Admin\ChangePasswordController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\PermissionController;
use App\Http\Controllers\Admin\PostCategoryController;
use App\Http\Controllers\Admin\PostController;
use App\Http\Controllers\Admin\ProgramCategoryController;
use App\Http\Controllers\Admin\ProgramController;
use App\Http\Controllers\Admin\PaymentController;
use App\Http\Controllers\Admin\PostTagController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\SliderController;
use App\Http\Controllers\Admin\TrashController;
use App\Http\Controllers\Admin\SocmedController;
use App\Http\Controllers\Admin\TransactionController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\WithdrawalController;
use Illuminate\Support\Facades\Route;

Route::get('/', [DashboardController::class, 'index'])->name('dashboard');
Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');
Route::get('/change-password', [ChangePasswordController::class, 'index'])->name('change-password.index');
Route::post('/change-password', [ChangePasswordController::class, 'update'])->name('change-password.update');

// users
Route::get('users/data', [UserController::class, 'data'])->name('users.data');
Route::get('users/trash', [UserController::class, 'trash'])->name('users.trash');
Route::delete('users/{id}/permanent', [UserController::class, 'deletePermanent'])->name('users.delete-permanent');
Route::post('users/{id}/restore', [UserController::class, 'restore'])->name('users.restore');
Route::resource('users', UserController::class)->except('show');
Route::post('users/change-status', [UserController::class, 'changeStatus'])->name('users.change-status');

// post category
Route::get('post-categories/data', [PostCategoryController::class, 'data'])->name('post-categories.data');
Route::resource('post-categories', PostCategoryController::class)->except('create', 'show', 'edit', 'update');

// post tag
Route::get('post-tags/data', [PostTagController::class, 'data'])->name('post-tags.data');
Route::resource('post-tags', PostTagController::class)->except('create', 'show', 'edit', 'update');

// program category
Route::get('programs-categories/data', [ProgramCategoryController::class, 'data'])->name('programs-categories.data');
Route::resource('programs-categories', ProgramCategoryController::class)->except('create', 'show', 'edit', 'update');

//payments
Route::get('payments/data', [PaymentController::class, 'data'])->name('payments.data');
Route::resource('payments', PaymentController::class)->except('create', 'show', 'edit', 'update');

//transactions
Route::get('transactions/data', [TransactionController::class, 'data'])->name('transactions.data');
Route::post('transactions/getById', [TransactionController::class, 'getById'])->name('transactions.getById');
Route::post('transactions/print', [TransactionController::class, 'print'])->name('transactions.print');
Route::post('transactions/export', [TransactionController::class, 'export'])->name('transactions.export');
Route::resource('transactions', TransactionController::class)->except('create', 'show', 'edit', 'update', 'store');
Route::post('transactions/change-status', [TransactionController::class, 'changeStatus'])->name('transactions.change-status');
Route::get('transactions/trash', [TransactionController::class, 'trash'])->name('transactions.trash');
Route::delete('transactions/{id}/permanent', [TransactionController::class, 'deletePermanent'])->name('transactions.delete-permanent');
Route::post('transactions/{id}/restore', [TransactionController::class, 'restore'])->name('transactions.restore');

// roles
Route::get('roles/data', [RoleController::class, 'data'])->name('roles.data');
Route::post('roles/get', [RoleController::class, 'get'])->name('roles.get');
Route::DELETE('roles/remove-permission', [RoleController::class, 'removePermission'])->name('roles.remove-permission');
Route::post('roles/add-permission', [RoleController::class, 'addPermission'])->name('roles.add-permission');
Route::resource('roles', RoleController::class)->except('create', 'show', 'edit', 'update');

// permissions
Route::get('permissions/data', [PermissionController::class, 'data'])->name('permissions.data');
Route::post('permissions/get', [PermissionController::class, 'get'])->name('permissions.get');
Route::post('permissions/getByRole', [PermissionController::class, 'getByRole'])->name('permissions.getByRole');
Route::resource('permissions', PermissionController::class)->except('create', 'show', 'edit', 'update');

// posts
Route::get('posts/data', [PostController::class, 'data'])->name('posts.data');
Route::get('posts/trash', [PostController::class, 'trash'])->name('posts.trash');
Route::delete('posts/{id}/permanent', [PostController::class, 'deletePermanent'])->name('posts.delete-permanent');
Route::post('posts/{id}/restore', [PostController::class, 'restore'])->name('posts.restore');
Route::resource('posts', PostController::class);
Route::post('posts/change-status', [PostController::class, 'changeStatus'])->name('posts.change-status');

// program
Route::get('program/get-for-withdrawals', [ProgramController::class, 'getForWithdrawal'])->name('program.get-for-withdrawals');
Route::get('program/data', [ProgramController::class, 'data'])->name('program.data');
Route::get('program/trash', [ProgramController::class, 'trash'])->name('program.trash');
Route::post('program/show-json', [ProgramController::class, 'showJson'])->name('program.show-json');
Route::delete('program/{id}/permanent', [ProgramController::class, 'deletePermanent'])->name('program.delete-permanent');
Route::post('program/{id}/restore', [ProgramController::class, 'restore'])->name('program.restore');
Route::resource('program', ProgramController::class);
Route::post('program/change-isPublished', [ProgramController::class, 'changeIsPublished'])->name('program.change-isPublished');

Route::post('program-budget', [ProgramController::class, 'budgets'])->name('program.budgets');

// filemanager
Route::group(['prefix' => 'filemanager', 'middleware' => ['web', 'auth']], function () {
    \UniSharp\LaravelFilemanager\Lfm::routes();
});

// socmed
Route::get('socmeds/data', [SocmedController::class, 'data'])->name('socmeds.data');
Route::resource('socmeds', SocmedController::class)->except('create', 'show', 'edit', 'update');

// sliders
Route::get('sliders/data', [SliderController::class, 'data'])->name('sliders.data');
Route::resource('sliders', SliderController::class);
Route::post('sliders/change-status', [SliderController::class, 'changeStatus'])->name('sliders.change-status');

//trash
// Route::get('program-trash',[ProgramController::class,'trashProgram'])->name('program-trash');
// Route::get('trash/program',[ProgramController::class,'program'])->name('trash-program');
// Route::get('restore/program/{id}',[ProgramController::class,'restoreProgram'])->name('restore-program');
// Route::get('delete/program/{id}',[ProgramController::class,'deleteProgram'])->name('delete-program');

// setting
Route::get('setting', [SettingController::class, 'index'])->name('settings.index');

Route::post('setting', [SettingController::class, 'update'])->name('settings.update');


// chart js
Route::post('/ajaxTransaction', [DashboardController::class, 'ajaxTransaction'])->name('ajaxTransaction');
Route::post('/ajaxKategoriProgram', [DashboardController::class, 'ajaxKategoriProgram'])->name('ajaxKategoriProgram');


// whitdrawal
Route::get('withdrawals/data', [WithdrawalController::class, 'data'])->name('withdrawals.data');
Route::resource('withdrawals', WithdrawalController::class)->except('show', 'edit', 'update');
