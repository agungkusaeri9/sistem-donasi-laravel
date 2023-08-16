<?php

namespace Database\Factories;

use App\Models\Payments;
use App\Models\Program;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Transaction>
 */
class TransactionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $code = rand(100,99999999);
        $program_id = Program::inRandomOrder()->first()->id;
        $payment_id = Payments::inRandomOrder()->first()->id;
        return [
            'code' => fake()->numberBetween(100000, 999999999),
            'program_id' => $program_id,
            'name' => fake()->name,
            'email' => fake()->email,
            'acceptance' => fake()->sentence(3),
            'nominal' => rand(100000,999999),
            'payment_id' => $payment_id,
            'is_verified' => rand(0,1),
            'phone_number' => fake()->phoneNumber(),
            'is_anonim' => rand(0,1)
        ];
    }
}
