<?php

namespace App\Filament\Admin\Resources\ProductResource\Api\Handlers;

use App\Filament\Admin\Resources\ProductResource;
use Illuminate\Http\Request;
use Rupadana\ApiService\Http\Handlers;

class UpdateHandler extends Handlers
{
    public static ?string $uri = '/{id}';

    public static ?string $resource = ProductResource::class;

    public static function getMethod()
    {
        return Handlers::PUT;
    }

    public static function getModel()
    {
        return static::$resource::getModel();
    }

    public function handler(Request $request)
    {
        $id = $request->route('id');

        // Cari produk berdasarkan ID
        $model = static::getModel()::find($id);
        if (! $model) {
            return static::sendNotFoundResponse();
        }

        // Validasi input
        $validated = $request->validate([
            'name' => 'sometimes|string|max:255',
            'description' => 'nullable|string',
        ]);

        // Perbarui produk
        $model->fill($validated);
        $model->save();

        return static::sendSuccessResponse($model, 'Successfully Updated Resource');
    }
}
