<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transaction_details', function (Blueprint $table) {
            $table->id();
            $table->integer('transaction_id');
            $table->string('snap_token');
            $table->dateTime('transaction_time')->nullable();
            $table->string('transaction_status')->nullable();
            $table->string('transaction_uuid')->nullable();
            $table->string('store')->nullable();
            $table->string('status_message')->nullable();
            $table->string('status_code')->nullable();
            $table->string('signature_key')->nullable();
            $table->dateTime('settlement_time')->nullable();
            $table->string('payment_code')->nullable();
            $table->string('payment_type')->nullable();
            $table->string('order_id')->nullable();
            $table->string('merchant_id')->nullable();
            $table->float('gross_amount')->nullable();
            $table->string('fraud_status')->nullable();
            $table->string('currency')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transaction_details');
    }
};
