<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class SuperAdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $client_id = User::orderBy('created_at','desc')->value('client_id');
        $client_id += 1;

        User::create([
            'name' => 'Super Admin',
            'email' => 'superadmin@outlook.com',
            'password' => Hash::make('password'),
            'role' => 'superadmin',
            'client_id' => $client_id,
        ]);
    }
}
