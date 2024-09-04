<?php

namespace App\Utils;

class CustomAudit
{
    public function initData($data)
    {
        $data['route'] = request()->route()->getName();
        $data['method'] = request()->method();
        $data['username'] = auth()->user()->username;
        $data['controller'] = request()->route()->getActionName();
        $data['payload'] = json_encode(request()->all());

        return $data;
    }
}
