<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Item>
 */
class ItemFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'name' => $this->faker->realText(10),
            'restaurant_id' => rand(1, 7),
            'cover' => 'items/food (' . rand(1, 33) . ').jpg',
            'price' => rand(10, 1000),
            'sort' => rand(0, 10),
        ];
    }
}