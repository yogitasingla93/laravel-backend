<?php
namespace App\Http\Controllers;

use App\Models\Timesheet;
use Illuminate\Http\Request;

class TimesheetController extends Controller
{
    // Create a new timesheet
    public function store(Request $request)
    {
        $request->validate([
            'task_name' => 'required|string|max:255',
            'date' => 'required|date',
            'hours' => 'required|integer',
            'user_id' => 'required|exists:users,id',
            'project_id' => 'required|exists:projects,id',
        ]);

        $timesheet = Timesheet::create($request->all());
        return response()->json($timesheet, 201);
    }

    // Get all timesheets
    public function index()
    {
        return Timesheet::all();
    }

    // Get a specific timesheet
    public function show($id)
    {
        return Timesheet::findOrFail($id);
    }

    // Update a specific timesheet
    public function update(Request $request, $id)
    {
        $request->validate([
            'task_name' => 'sometimes|required|string|max:255',
            'date' => 'sometimes|required|date',
            'hours' => 'sometimes|required|integer',
        ]);

        $timesheet = Timesheet::findOrFail($id);
        $timesheet->update($request->all());
        return response()->json($timesheet, 200);
    }

    // Delete a specific timesheet
    public function destroy($id)
    {
        $timesheet = Timesheet::findOrFail($id);
        $timesheet->delete();
        return response()->json(null, 204);
    }
}
