<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Timesheet;
use App\Models\User;
use App\Models\Project;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Timesheet>
 */
class TimesheetFactory extends Factory
{
    protected $model = Timesheet::class;

    public function definition(): array
    {
        return [
            'user_id' => User::factory(),  // Ensuring valid user_id
            'project_id' => Project::factory(),  // Ensuring valid project_id
            'hours' => $this->faker->randomFloat(2, 1, 8), // Example field: random hours between 1-8
            'date' => $this->faker->date(),
        ];
    }
}
