<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Contracts\Permission;
use Spatie\Permission\Models\Permission as ModelsPermission;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            ['name' => 'Dashboard'],
            ['name' => 'Profile View'],
            ['name' => 'Change Password View'],
            ['name' => 'Post Category View',],
            ['name' => 'Post Category Create',],
            ['name' => 'Post Category Edit',],
            ['name' => 'Post Category Delete'],
            ['name' => 'Post Tag View',],
            ['name' => 'Post Tag Create',],
            ['name' => 'Post Tag Edit',],
            ['name' => 'Post Tag Delete'],
            ['name' => 'Post View',],
            ['name' => 'Post Create',],
            ['name' => 'Post Edit',],
            ['name' => 'Post Delete'],
            ['name' => 'Post Detail'],
            ['name' => 'Post Change Status'],

            ['name' => 'Program Category View',],
            ['name' => 'Program Category Create',],
            ['name' => 'Program Category Edit',],
            ['name' => 'Program Category Delete'],

            ['name' => 'Program View',],
            ['name' => 'Program Create',],
            ['name' => 'Program Edit',],
            ['name' => 'Program Delete'],
            ['name' => 'Program Detail'],
            ['name' => 'Program Change Status'],

            ['name' => 'Payment View',],
            ['name' => 'Payment Create',],
            ['name' => 'Payment Edit',],
            ['name' => 'Payment Delete'],

            ['name' => 'Transaction View',],
            ['name' => 'Transaction Detail',],
            ['name' => 'Transaction Print',],
            ['name' => 'Transaction Export'],
            ['name' => 'Transaction Delete'],

            ['name' => 'Trash View',],
            ['name' => 'Trash Restore',],
            ['name' => 'Trash Delete Permanent',],

            ['name' => 'Social Media View',],
            ['name' => 'Social Media Create',],
            ['name' => 'Social Media Edit',],
            ['name' => 'Social Media Delete'],

            ['name' => 'Slider View',],
            ['name' => 'Slider Create',],
            ['name' => 'Slider Edit',],
            ['name' => 'Slider Delete'],
            ['name' => 'Slider Detail'],
            ['name' => 'Filemanager View'],

            ['name' => 'Role View View',],
            ['name' => 'Role View Create',],
            ['name' => 'Role View Edit',],
            ['name' => 'Role View Delete'],
            ['name' => 'Role Permission'],

            ['name' => 'Permission View',],
            ['name' => 'Permission Create',],
            ['name' => 'Permission Edit',],
            ['name' => 'Permission Delete'],
            ['name' => 'Setting View',],
            ['name' => 'Sitemap View',]
        ];

        foreach ($data as $dt) {
            ModelsPermission::create($dt);
        }
    }
}
