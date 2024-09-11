<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Barista;
use App\Models\GerobakStok;
use App\Utils\ApiResponse;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class BaristaController extends Controller
{

   use ApiResponse;

   function format_distance($distance, $unit = 'km')
   {
      if ($unit === 'km') {
         if ($distance < 1) {
            // Ubah jarak ke meter jika kurang dari 1 km
            $distance_in_meters = $distance * 1000;
            return number_format($distance_in_meters, 0) . ' m';
         } else {
            return number_format($distance, 2) . ' km';
         }
      } else {
         // Default ke meter
         return number_format($distance, 0) . ' m';
      }
   }

   function haversine_distance($lat1, $lon1, $lat2, $lon2, $unit = 'km') {
      $earth_radius = ($unit === 'km') ? 6371 : 3958.8; // Radius bumi dalam kilometer atau mil
  
      $lat_from = deg2rad($lat1);
      $lon_from = deg2rad($lon1);
      $lat_to = deg2rad($lat2);
      $lon_to = deg2rad($lon2);
  
      $lat_diff = $lat_to - $lat_from;
      $lon_diff = $lon_to - $lon_from;
  
      $a = sin($lat_diff / 2) ** 2 + cos($lat_from) * cos($lat_to) * sin($lon_diff / 2) ** 2;
      $c = 2 * atan2(sqrt($a), sqrt(1 - $a));
  
      $distance = $earth_radius * $c;
  
      // Konversi jarak ke meter jika unit 'm'
      if ($unit === 'm') {
          $distance *= 1000;
      }
  
      return (float) $distance; // Pastikan hasilnya adalah float
  }
  

   function calculate_walking_time($distance, $unit = 'km') {
      $walking_speed_kmh = 5; // Kecepatan rata-rata jalan kaki dalam km/jam
      
      if ($unit === 'm') {
          $distance_km = $distance / 1000;
      } else {
          $distance_km = $distance;
      }
  
      $time_hours = $distance_km / $walking_speed_kmh;
      $time_minutes = $time_hours * 60;
  
      return number_format($time_minutes, 0) . ' menit';
  }
  

   public function baristaTerdekat(Request $request)
   {

      $lat_konsumen = $request->lat_konsumen;
      $long_konsumen = $request->long_konsumen;



      try {

         $unit = 'km'; // Ubah ke 'm' untuk meter, atau biarkan 'km' untuk kilometer


         $data = Barista::with('gerobak', 'user')->get();
         $data = $data->filter(function ($barista) use ($lat_konsumen, $long_konsumen, $unit) {
            $barista_lat = $barista->gerobak?->latitude;
            $barista_lon = $barista->gerobak?->longitude;

          
            if ($barista_lat !== null && $barista_lon !== null) {
               $distance = $this->haversine_distance($lat_konsumen, $long_konsumen, $barista_lat, $barista_lon, $unit);
               $barista->distance = $distance;
               $barista->walking_time = $this->calculate_walking_time($distance, $unit);
               return true; // Barista termasuk dalam hasil
            }

            return false; // Barista tidak termasuk dalam hasil
         })->map(function ($barista) {
            return [
             
              

               'barista_id' => $barista?->id,
               'user_id' => $barista?->user?->id,
               'nama' => strtoupper($barista->user?->name),
               'foto' => $barista?->user?->foto,
               'kontak' => $barista?->user?->kontak,
               'distance' => $barista?->distance,
               'estimasi' => $barista?->walking_time,
               'lokasi_terkini' => $barista?->gerobak?->lokasi_terkini,
               'latitude' => $barista?->gerobak->latitude,
               'longitude' => $barista?->gerobak->longitude,
               'gerobak_id' => $barista?->gerobak?->id,
               'gerobak_nama' => $barista?->gerobak?->nama,
               'info' => ''
            ];
         });

         // Urutkan data berdasarkan jarak terdekat
         $data = $data->sortBy(function ($item) use ($unit) {
            return ($unit === 'km') ? floatval(str_replace(' km', '', $item['distance'])) : floatval(str_replace(' m', '', $item['distance'])) / 1000;
         });
         // Ambil barista terdekat (misalnya yang p

         // // Ambil barista terdekat (misalnya yang pertama)
         // $closestBarista = $data->first();

         return response()->json($data);
      } catch (ModelNotFoundException $e) {
         return $this->error("barista tidak ditemukan", 404);
      }


      return $this->success("List Barista Terdekat", $data);
   }

   public function detail($barista_id)
   {
      try {
         $barista = Barista::where('id', $barista_id)->with('gerobak', 'user')->first();

         $stok = GerobakStok::with('produk')->where('gerobak_id', $barista->gerobak?->id)->get();
         $stok->transform(function ($stok) {
            return [
               'produk_id' => $stok->produk?->id,
               'nama' => $stok->produk?->nama,
               'foto' => $stok->produk?->foto,
               'stok' => $stok?->jumlah_stok,
            ];
         });
         $transformedData = [
            'barista_id' => $barista->id,
            'user_id' => $barista->user?->id,
            'nama' => strtoupper($barista->user?->name),
            'foto' => $barista?->user?->foto,
            'kontak' => $barista?->user?->kontak,
            'jarak' => '',
            'estimasi' => '',
            'lokasi_terkini' => '',
            'latitude' => '',
            'longitude' => '',
            'gerobak_id' => $barista->gerobak?->id,
            'gerobak_nama' => $barista->gerobak?->nama,
            'info' => '',
            'stok' => $stok
         ];


         return response()->json($transformedData);
      } catch (ModelNotFoundException $e) {
         return $this->error("barista tidak ditemukan", 404);
      }


      return $this->success("List Barista Terdekat", $data);
   }

   public function baristaProduk()
   {
      try {
         $barista = Barista::where('id', auth()->user()->id)->with('gerobak', 'user')->first();

         $stok = GerobakStok::with('produk')->where('gerobak_id', $barista->gerobak?->id)->get();
         $stok->transform(function ($stok) {
            return [
               'produk_id' => $stok->produk?->id,
               'nama' => $stok->produk?->nama,
               'foto' => $stok->produk?->foto,
               'stok' => $stok?->jumlah_stok,
            ];
         });
         $transformedData = [
            'barista_id' => $barista->id,
            'user_id' => $barista->user?->id,
            'nama' => strtoupper($barista->user?->name),
            'foto' => $barista?->user?->foto,
            'kontak' => $barista?->user?->kontak,
            'gerobak_id' => $barista->gerobak?->id,
            'gerobak_nama' => $barista->gerobak?->nama,
            'info' => '',
            'stok' => $stok
         ];


         return response()->json($transformedData);
      } catch (ModelNotFoundException $e) {
         return $this->error("barista tidak ditemukan", 404);
      }


      return $this->success("List Barista Terdekat", $data);
   }
}
