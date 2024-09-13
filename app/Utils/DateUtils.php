<?php

namespace App\Utils;

use DateTime;
use Exception;
use Illuminate\Support\Carbon;

class DateUtils
{
    public static function human($date, $minDate = 2)
    {
        if ($date?->diffInHours(Carbon::now()) >= 2) {
            return Carbon::make($date)->format('d/m/Y H:m:s');
        }

        return Carbon::make($date)?->diffForHumans();
    }

    public static function format($date)
    {
    
      if ($date != null) {
         try {
             // Coba dengan format 'd/m/Y'
             return Carbon::createFromFormat('d/m/Y', $date)->format('Y-m-d');
         } catch (Exception $e) {
             try {
                 // Jika gagal, coba dengan format 'd-m-Y'
                 return Carbon::createFromFormat('d-m-Y', $date)->format('Y-m-d');
             } catch (Exception $e) {
                 // Jika keduanya gagal, bisa return null atau pesan error
                 return null; // Atau return pesan error
             }
         }
     }
 
     return null;
    }

    public static function rangeDate($dateRange)
    {
    
        if ($dateRange) {
            $dateString = $dateRange;
            $dateArray = explode(' to ', $dateString);
        
            $startDateStr = trim($dateArray[0]);
            $endDateStr = trim($dateArray[1]);

            $startDate = DateTime::createFromFormat('d/m/Y', $startDateStr);
            $endDate = DateTime::createFromFormat('d/m/Y', $endDateStr);

            return collect([
                'start_date' => $startDate->format('Y-m-d'),
                'end_date' => $endDate->format('Y-m-d'),
            ]);
        } else {
            return collect([
                'start_date' => null,
                'end_date' => null,
            ]);
        }
    }
}
