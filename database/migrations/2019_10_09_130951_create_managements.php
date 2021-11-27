<?php //b4f2e6d787e3632e35b6465fb958eef5

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateManagements extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('managements', function (Blueprint $table) {
            $table->increments('id');
            $table->string('rut');        
            $table->string('name');
            $table->string('address');
            $table->integer('phone_contact');
            $table->string('mail_contact');
            $table->unsignedInteger('code_id');
            $table->foreign('code_id')->references('id')->on('codes');
            $table->unsignedInteger('commune_id');
            $table->foreign('commune_id')->references('id')->on('communes');
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
        Schema::dropIfExists('managements');
    }
}
