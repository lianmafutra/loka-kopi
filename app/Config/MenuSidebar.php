<?php

namespace App\Config;

class MenuSidebar
{
   public static function render()
   {
      return collect([
         [
            'type' => 'header',
            'title' => 'App Settings',
            'permission' => ['dashboard-app'],
         ],
         [
            'type' => 'menu',
            'title' => 'Dashboard Admin',
            'url' => route('dashboard'),
            'icon' => 'fas fa-tachometer-alt',
            'active' => ['admin/dashboard*'],
            'permission' => ['dashboard-app'],
         ],
         [
            'type' => 'tree',
            'title' => 'Role Permissions',
            'url' => '#',
            'icon' => 'fas fa-user-shield',
            'active' => ['admin/app/*'],
            'permission' => ['role_permissions'],
            'items' => [
               [
                  'type' => 'menu',
                  'title' => 'Master User',
                  'url' => route('master-user.index'),
                  'icon' => 'fas fa-user',
                  'active' => ['admin/app/master-user*'],
               ],
               [
                  'type' => 'menu',
                  'title' => 'Role',
                  'url' => route('role.index'),
                  'icon' => 'fas fa-user-cog',
                  'active' => ['admin/app/role*'],
               ],
               [
                  'type' => 'menu',
                  'title' => 'Permissions Group',
                  'url' => route('permission-group.index'),
                  'icon' => 'fas fa-layer-group',
                  'active' => ['admin/app/permission-group*'],
               ],
               [
                  'type' => 'menu',
                  'title' => 'Permissions',
                  'url' => route('permission.index'),
                  'icon' => 'fas fa-unlock',
                  'active' => ['admin/app/permission/*', 'admin/app/permission'],
               ],
            ],
         ],
         [
            'type' => 'menu',
            'title' => 'Settings',
            'url' => route('settings.index'),
            'icon' => 'fas fa-cog',
            'active' => ['admin/settings'],
            'permission' => ['settings'],
         ],
         [
            'type' => 'header',
            'title' => 'Data Master',
            'permission' => ['role-admin'],
         ],

         [
            'type' => 'menu',
            'title' => 'Data Obat',
            'url' => route('master-data.obat.index'),
            'icon' => 'fas fa-angle-right',
            'active' => ['master-data/obat*','master-data/penyesuaian/obat*'],
            'permission' => ['role-admin'],
         ],
         
         [
            'type' => 'menu',
            'title' => 'Data Dokter',
            'url' => route('master-data.dokter.index'),
            'icon' => 'fas fa-angle-right',
            'active' => ['master-data/dokter*'],
            'permission' => ['role-admin'],
         ],
        
         [
            'type' => 'tree',
            'title' => 'Data Anggota',
            'url' => '#',
             'icon' => 'fas fa-angle-right',
            'active' => ['master-data/anggota/personil*','master-data/anggota/siswa*','master-data/angkatan*'],
            'permission' => ['role-admin'],
            'items' => [
               [
                  'type' => 'menu',
                  'title' => 'Data Siswa',
                  'url' => route('master-data.siswa.index'),
                  'icon' => 'far fa-circle',
                  'active' => ['master-data/anggota/siswa*'],
      
               ],
               [
                  'type' => 'menu',
                  'title' => 'Angkatan Siswa',
                  'url' => route('angkatan.index'),
                  'icon' => 'far fa-circle',
                  'active' => ['master-data/angkatan*'],
      
               ],
               [
                  'type' => 'menu',
                  'title' => 'Data Personil',
                  'url' => route('master-data.personil.index'),
                  'icon' => 'far fa-circle',
                  'active' => ['master-data/anggota/personil*'],
      
               ],
            ]
            ],
         
         [
            'type' => 'menu',
            'title' => 'Data Pengguna',
            'url' => route('master-data.pengguna.index'),
            'icon' => 'fas fa-angle-right',
            'active' => ['master-data/pengguna*'],
            'permission' => ['role-admin'],
         ],

         [
            'type' => 'header',
            'title' => 'Menu',
         ],
         [
            'type' => 'menu',
            'title' => 'Dashboard',
            'url' => route('klinik.dashboard.index'),
            'icon' => 'fas fa-angle-right',
            'active' => ['dashboard*'],

         ],
         // [
         //    'type' => 'menu',
         //    'title' => ' Rekam Medis',
         //    'url' => route('settings.index'),
         //    'icon' => 'fas fa-angle-right',
         //    'active' => ['admin/settings'],
         //    'permission' => ['settings'],
         // ],

        
        
         [
            'type' => 'tree',
            'title' => 'Laporan',
            'url' => '#',
            'icon' => 'fas fa-angle-right',
            'active' => ['laporan*'],
            'items' => [
               [
                  'type' => 'menu',
                  'title' => 'Laporan Data Pemeriksaan',
                  'url' => route('laporan.pemeriksaan'),
                  'icon' => 'far fa-circle',
                  'active' => ['laporan/pemeriksaan'],
               ],
               [
                  'type' => 'menu',
                  'title' => 'Laporan Rikkes Siswa',
                  'url' => route('laporan.rikkes.siswa'),
                  'icon' => 'far fa-circle',
                  'active' => ['laporan/rikkes/siswa'],
               ],
               [
                  'type' => 'menu',
                  'title' => 'Laporan Obat',
                  'url' => route('laporan.obat'),
                  'icon' => 'far fa-circle',
                  'active' => ['laporan/obat'],
               ],
               

               // [
               //    'type' => 'menu',
               //    'title' => 'Laporan Data Obat',
               //    'url' => route('laporan.obat'),
               //    'icon' => 'far fa-circle',
               //    'active' => ['laporan/obat'],
               // ],

            ],

         ],
         [
            'type' => 'menu',
            'title' => 'Profile',
            'url' => route('user.profile'),
            'icon' => 'fas fa-angle-right',
            'active' => ['user/profile*'],
         ],

        
         // [
         //    'type' => 'header',
         //    'title' => 'Menu App',
         // ],
         // [
         //    'type' => 'menu',
         //    'title' => 'Beranda',
         //    'url' => route('beranda.index'),
         //    'icon' => 'fas fa-home',
         //    'active' => ['beranda*'],
         // ],
         // [
         //    'type'   => 'tree',
         //    'title'  => 'Sample Data',
         //    'url'    => '#',
         //    'icon'   => 'fas fa-folder-open',
         //    'active' => ['sample-crud*'],
         //    'permission' => 'sample_data',
         //    'items' => [
         //       [
         //          'type'   => 'menu',
         //          'title'  => 'Form Component',
         //          'url'    => route('sample-crud.create'),
         //          'icon'   => 'fas fa-folder-open',
         //          'active' => ['sample-crud/create']
         //       ],
         //       [
         //          'type'   => 'menu',
         //          'title'  => 'Datatable',
         //          'url'    => route('sample-crud.index'),
         //          'icon'   => 'fas fa-table',
         //          'active' => ['sample-crud']
         //       ],
         //    ],
         // ],
         // [
         //    'type' => 'menu',
         //    'title' => 'Data User',
         //    'url' => route('data-user.index'),
         //    'icon' => 'fas fa-users',
         //    'active' => ['data-user*'],
         //    'permission' => ['master-user-list'],
         // ],
         // [
         //    'type' => 'menu',
         //    'title' => 'Profile',
         //    'url' => route('user.profile'),
         //    'icon' => 'fas fa-angle-right',
         //    'active' => ['user/profile*'],
         // ],
      ]);
   }
}
