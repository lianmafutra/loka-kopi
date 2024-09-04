<?php

namespace App\Services\Permissions;

class PermissionsGate
{
    public function check($name, $data, $add = [])
    {
        $data->middleware('permission:'.$name.'-list', ['only' => ['index']]);
        $data->middleware('permission:'.$name.'-create', ['only' => ['create', 'store']]);
        $data->middleware('permission:'.$name.'-edit', ['only' => ['edit', 'update']]);
        $data->middleware('permission:'.$name.'-delete', ['only' => ['destroy']]);

        foreach ($add as $key => $value) {
            $data->middleware('permission:'.$name.'-'.$value['name'], ['only' => [$value['function']]]);
        }

    }
}
