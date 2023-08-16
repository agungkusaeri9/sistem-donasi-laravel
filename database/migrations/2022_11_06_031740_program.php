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
        Schema::create('programs', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('slug')->unique();
            $table->foreignId('program_category_id')->constrained('program_categories')->cascadeOnDelete()->cascadeOnUpdate();
            $table->date('time_up')->nullable();
            $table->bigInteger('donation_collacted')->nullable();
            $table->text('description');
            $table->text('diagnosa');
            $table->string('meta_keyword')->nullable();
            $table->string('meta_description')->nullable();
            $table->string('image')->nullable();
            $table->boolean('status')->default(0);
            $table->boolean('is_published')->default(0);
            $table->boolean('is_selected')->default(0);
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete()->cascadeOnUpdate();
            $table->bigInteger('donation_target')->nullable();
            $table->string('location')->nullable();
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
        Schema::dropIfExists('programs');
    }
};
