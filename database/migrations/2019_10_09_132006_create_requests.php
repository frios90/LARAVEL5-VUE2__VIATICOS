<?php //b4f2e6d787e3632e35b6465fb958eef5

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRequests extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('requests', function (Blueprint $table) {
            $table->increments('id');
            $table->string('folio');
            $table->integer('staff_amount')->nullable();
            $table->date('going_at');
            $table->date('return_at');
            $table->longText('description');
            $table->integer('cash');
            $table->string('destiny')->nullable();
            $table->unsignedInteger('commune_id');
            $table->foreign('commune_id')->references('id')->on('communes');
            $table->unsignedInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users');
            $table->unsignedInteger('user_management_id')->nullable();
            $table->foreign('user_management_id')->references('id')->on('users');
            $table->unsignedInteger('user_approve_id')->nullable();
            $table->foreign('user_approve_id')->references('id')->on('users');
            $table->unsignedInteger('code_id');
            $table->foreign('code_id')->references('id')->on('codes');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('requests');
    }
}
