<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Project;
use App\Models\Timesheet;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Create Users
        User::factory(10)->create()->each(function ($user) {
            // Create Projects and Assign Users
            $projects = Project::factory(2)->create([
                'status' => 'active', // Removed first_name and last_name
            ]);

            $user->projects()->attach($projects->pluck('id'));

            // Create Timesheets
            Timesheet::factory(3)->create([
                'user_id' => $user->id,
                'project_id' => $projects->random()->id, // Ensuring valid project reference
            ]);
        });
    }
}
