<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use phpseclib3\Crypt\PublicKeyLoader;
use phpseclib3\Net\SSH2;



class deployku extends Command
{
   /**
    * The name and signature of the console command.
    *
    * @var string
    */
   protected $signature = 'deployku';

   /**
    * The console command description.
    *
    * @var string
    */
   protected $description = 'Command description';

   /**
    * Execute the console command.
    *
    * @return int
    */
   public function handle()
   {
      try {
         $path_project = config('deploy.server.path');
         $ssh = new SSH2(config('deploy.server.host'));
         if (!$ssh->login('admin-panel', config('deploy.server.password'))) {
            $this->error('Connect SSH Failed ...');
            return false;
         } else {
            $this->info('Connect SSH Success ...');
         }
         $this->info('Waiting to pull Source From Repository Github to Server');
         echo $ssh->exec('cd '.$path_project.' && sudo -u root git reset --hard HEAD && git pull');
         $this->info('Running : php artisan optimize:clear');
         echo $ssh->exec('cd '.$path_project.' && sudo -u root php artisan optimize');
      } catch (\Throwable $th) {
         $this->info('error ' . $th->getMessage());
      }
   }
}
