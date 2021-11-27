<?php //b4f2e6d787e3632e35b6465fb958eef5

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRequestDetails extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rate_request', function (Blueprint $table) {
            $table->integer('qty');
            $table->integer('value');
            $table->unsignedInteger('request_id');
            $table->foreign('request_id')->references('id')->on('requests');
            $table->unsignedInteger('rate_id');
            $table->foreign('rate_id')->references('id')->on('rates');
           
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rate_request');
    }
}
