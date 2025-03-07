<?php

namespace App\Http\Controllers;

use App\Models\Attribute;
use Illuminate\Http\Request;

class AttributeController extends Controller
{
    // List all attributes
    public function index()
    {
        return response()->json(Attribute::all());
    }

    // Create a new attribute
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|unique:attributes,name',
            'type' => 'required|in:text,number,date,select'
        ]);

        $attribute = Attribute::create($request->all());

        return response()->json($attribute, 201);
    }

    // Show a single attribute
    public function show(Attribute $attribute)
    {
        return response()->json($attribute);
    }

    // Update an attribute
    public function update(Request $request, Attribute $attribute)
    {
        $request->validate([
            'name' => 'required|string|unique:attributes,name,' . $attribute->id,
            'type' => 'required|in:text,number,date,select'
        ]);

        $attribute->update($request->all());

        return response()->json($attribute);
    }

    // Delete an attribute
    public function destroy(Attribute $attribute)
    {
        $attribute->delete();

        return response()->json(['message' => 'Attribute deleted successfully']);
    }
}
