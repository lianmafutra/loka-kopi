<?php

namespace App\Console\Commands;

use App\Models\Komentar;
use App\Models\LaporanKeuangan;
use App\Models\PelaporanCHR;
use App\Models\TinjukCHR;
use Illuminate\Console\Command;

class resetTable extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'reset:table';

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
         PelaporanCHR::query()->truncate();
         TinjukCHR::query()->truncate();
         Komentar::query()->truncate();
         PelaporanCHR::query()->truncate();
         LaporanKeuangan::query()->truncate();
         return $this->info('Success');
      } catch (\Throwable $th) {
         return $this->info($th);
      }
        
    }
}
