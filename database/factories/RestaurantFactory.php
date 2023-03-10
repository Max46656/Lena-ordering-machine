<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Restaurant>
 */
class RestaurantFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'name' => $this->faker->company,
            'cover' => 'restaurants/餐廳 (' . rand(1, 10) . ').jpg',
            'tel' => $this->faker->phoneNumber,
            'address' => $this->faker->streetAddress,
        ];
    }
}