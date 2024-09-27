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
        Schema::table('withdrawal', function (Blueprint $table) {
            $table->string('bank_name')->nullable();
            $table->string('bank_number')->nullable();
            $table->string('bank_owner')->nullable();
            $table->string('proof')->nullable();
            $table->string('admin_fee')->nullable();
            $table->string('total')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('withdrawal', function (Blueprint $table) {
            $table->dropColumn('bank_name');
            $table->dropColumn('bank_number');
            $table->dropColumn('bank_owner');
            $table->dropColumn('proof');
            $table->dropColumn('admin_fee');
            $table->dropColumn('total');
        });
    }
};
