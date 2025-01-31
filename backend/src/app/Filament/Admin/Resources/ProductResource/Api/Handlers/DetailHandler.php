<?php

namespace App\Filament\Admin\Resources\ProductResource\Api\Handlers;

use App\Filament\Admin\Resources\ProductResource;
use Illuminate\Http\Request;
use Rupadana\ApiService\Http\Handlers;

class DetailHandler extends Handlers
{
    public static ?string $uri = '/{id}';

    public static ?string $resource = ProductResource::class;

    public function handler(Request $request)
    {
        $id = $request->route('id');

        // Ambil data produk berdasarkan ID
        $query = static::getModel()::find($id);

        if (! $query) {
            return static::sendNotFoundResponse();
        }

        return static::sendSuccessResponse($query, 'Successfully Fetched Detail');
    }
}
