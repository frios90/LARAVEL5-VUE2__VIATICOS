<?php

use Illuminate\Database\Seeder;
use App\Models\Type;

class GcomidaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Type::insert([
            'name' => 'EXPENSE_FOOD',
            'label' => 'Gastos de Manutención',
            'description' => 'Gastos varios en alimentos durante las jornadas del evento.',
            'created_at' => $now,
            'updated_at' => $now
        ]);
    }
}
