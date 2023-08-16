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
        Schema::create('donaturs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('program_id')->constrained('programs')->cascadeOnDelete();
            $table->string('name');
            $table->string('email')->nullable();
            $table->string('acceptance')->nullable();
            $table->bigInteger('nominal');
            $table->integer('payment_id')->nullable();
            $table->string('evidence')->nullable();
            $table->boolean('is_verified')->default(0);
            $table->string('phone_number')->nullable();
            $table->boolean('is_anonim')->default(0);
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
        Schema::dropIfExists('donaturs');
    }
};
