<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Project;
use App\Models\Attribute;
use App\Models\AttributeValue;

class ProjectAttributeController extends Controller
{
    /**
     * Get all attributes of a project.
     */
    public function show(Project $project)
    {
        $attributes = $project->attributes()->with('attribute')->get();

        return response()->json([
            'project_id' => $project->id,
            'attributes' => $attributes
        ], 200);
    }

    /**
     * Assign attributes to a project.
     */
    public function setAttributes(Request $request, Project $project)
    {
        $request->validate([
            'attributes' => 'required|array',
            'attributes.*.attribute_id' => 'required|exists:attributes,id',
            'attributes.*.value' => 'required|string',
        ]);

        foreach ($request->attributes as $attr) {
            AttributeValue::updateOrCreate(
                [
                    'attribute_id' => $attr['attribute_id'],
                    'project_id' => $project->id
                ],
                ['value' => $attr['value']]
            );
        }

        return response()->json(['message' => 'Attributes assigned successfully'], 201);
    }

    /**
     * Update a specific attribute for a project.
     */
    public function updateAttribute(Request $request, Project $project, Attribute $attribute)
    {
        $request->validate(['value' => 'required|string']);

        $attributeValue = AttributeValue::where([
            'project_id' => $project->id,
            'attribute_id' => $attribute->id
        ])->first();

        if (!$attributeValue) {
            return response()->json(['error' => 'Attribute not found for this project'], 404);
        }

        $attributeValue->update(['value' => $request->value]);

        return response()->json(['message' => 'Attribute updated successfully'], 200);
    }

    /**
     * Remove a specific attribute from a project.
     */
    public function removeAttribute(Project $project, Attribute $attribute)
    {
        $deleted = AttributeValue::where([
            'project_id' => $project->id,
            'attribute_id' => $attribute->id
        ])->delete();

        if (!$deleted) {
            return response()->json(['error' => 'Attribute not found'], 404);
        }

        return response()->json(['message' => 'Attribute removed successfully'], 200);
    }
}
