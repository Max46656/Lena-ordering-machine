<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\RestaurantTag>
 */
class RestaurantTagFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'restaurant_id'=> rand(1,100),
            'tag_id'=> rand(1,30),
            'color'=>$this->faker->randomElement(['#FFFFFF','#000000','#FF0000'])
        ];
    }
}
