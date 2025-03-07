<?php

namespace App\Http\Controllers;

use App\Models\Project;
use Illuminate\Http\Request;

class ProjectController extends Controller
{
    // Create a new project
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'status' => 'required|string|max:255',
        ]);

        $project = Project::create($request->all());
        return response()->json($project, 201);
    }

    // Get all projects
    public function index()
    {
        return Project::all();
    }

    // Get a specific project
    public function show($id)
    {
        return Project::findOrFail($id);
    }

    // Update a specific project
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'status' => 'required|string|in:active,inactive', // Validate status field
        ]);
    
        $project = Project::findOrFail($id);
        $project->update($request->all());
        return response()->json($project, 200);
    }

    // Delete a specific project
    public function destroy($id)
    {
        $project = Project::findOrFail($id);
        $project->delete();
        return response()->json(['message' => 'Project deleted successfully'], 204);
    }
}
