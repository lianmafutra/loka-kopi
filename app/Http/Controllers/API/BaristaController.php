<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\API\BaristaInfoStatusRequestAPI;
use App\Http\Requests\API\LokasiUpdateRequestAPI;
use App\Models\Barista;
use App\Models\Gerobak;
use App\Models\GerobakStok;
use App\Models\HistoriLokasi;
use App\Utils\ApiResponse;
use App\Utils\Rupiah;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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

   function haversine_distance($lat1, $lon1, $lat2, $lon2, $unit = 'km')
   {
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


   function calculate_walking_time($distance, $unit = 'km')
   {
      $walking_speed_kmh = 5; // Kecepatan rata-rata jalan kaki dalam km/jam

      if ($unit === 'm') {
         $distance_km = $distance / 1000;
      } else {
         $distance_km = $distance;
      }

      $time_hours = $distance_km / $walking_speed_kmh;
      $total_minutes = $time_hours * 60;

      // Hitung jam dan menit
      $hours = floor($total_minutes / 60);
      $minutes = round($total_minutes % 60);

      // Format output
      if ($hours > 0 && $minutes > 0) {
         return "$hours jam $minutes menit";
      } elseif ($hours > 0) {
         return "$hours jam";
      } else {
         return "$minutes menit";
      }
   }

   function transformDistance($distanceInKm)
   {
      $distanceInMeters = $distanceInKm * 1000; // konversi km ke meter

      if ($distanceInMeters < 1000) {
         return round($distanceInMeters, 2) . ' m';
      } else {
         return round($distanceInKm, 2) . ' Km';
      }
   }


   public function baristaTerdekat(Request $request)
   {

      $lat_konsumen = floatval($request->lat_konsumen);
      $long_konsumen = floatval($request->long_konsumen);



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
               'path_foto' => url('storage/uploads/barista/' . $barista?->user?->foto),
               'kontak' => $barista?->user?->kontak,
               'distance' => $barista->distance,
               'estimasi' => $barista?->walking_time,
               'lokasi_terkini' => $barista?->gerobak?->lokasi_terkini,
               'latitude' => $barista?->gerobak->latitude,
               'longitude' => $barista?->gerobak->longitude,
               'gerobak_id' => $barista?->gerobak?->id,
               'gerobak_nama' => $barista?->gerobak?->nama,
               'info' =>$barista?->info
            ];
         });

         // Konversi array ke Collection
         $collection = collect($data);

         // Urutkan berdasarkan key 'distance' dari yang terkecil
         $sorted = $collection->sortBy('distance');

         // Ubah nilai distance ke meter atau km sesuai kondisi
         $transformed = $sorted->map(function ($item) {
            $distanceInKm = $item['distance'];
            $distanceInMeters = $distanceInKm * 1000; // konversi km ke meter

            if ($distanceInMeters < 1000) {
               $item['distance'] = round($distanceInMeters, 2) . ' m';
            } else {
               $item['distance'] =  round($distanceInKm, 2) . ' Km';
            }

            return  $item;
         });

         // Konversi kembali ke array jika diperlukan
         $transformedArray = $transformed->values()->toArray();
         // $sortedBaristas = $baristas->sortBy('distance');
         // Urutkan data berdasarkan jarak terdekat
         // $data2 = $data->sortBy(function ($item) use ($unit) {
         //    return ($unit === 'km') ? floatval(str_replace(' km', '', $item['distance'])) : floatval(str_replace(' m', '', $item['distance'])) / 1000;
         // });
         // Ambil barista terdekat (misalnya yang p

         // // Ambil barista terdekat (misalnya yang pertama)
         // $closestBarista = $data->first();

         return $this->success("Barista Terdekat", $transformedArray);
      } catch (ModelNotFoundException $e) {
         return $this->error("barista tidak ditemukan", 404);
      }


      // return $this->success("List Barista Terdekat", $data);
   }

   public function detail($barista_id, Request $request)
   {
      try {


         

         $distanceNew = null;

         $barista = Barista::with('gerobak', 'user')->findOrFail($barista_id);
       

         $stok = GerobakStok::with('produk')->where('gerobak_id', $barista->gerobak?->id)->get();
         $stok->transform(function ($stok) {
            return [
               'produk_id' => $stok->produk?->id,
               'nama' => $stok->produk?->nama,
               // 'foto' => $stok->produk?->foto,
               'foto_url' => $stok->produk?->foto_url,
               'stok' => $stok?->jumlah_stok,
               'harga' => $stok?->produk?->harga,
               'harga_format' =>  "Rp" . Rupiah::toRupiah($stok?->produk?->harga),
            ];
         });




         if ($request->has('lat_konsumen') && $request->has('long_konsumen')) {
            if ($request->lat_konsumen != null && $request->long_konsumen != null) {
               $lat_konsumen = floatval($request->lat_konsumen);
               $long_konsumen = floatval($request->long_konsumen);
               $unit = 'km'; // Ubah ke 'm' untuk meter, atau biarkan 'km' untuk kilometer
               $barista_lat = $barista->gerobak?->latitude;
               $barista_lon = $barista->gerobak?->longitude;
               $distance = $this->haversine_distance($lat_konsumen, $long_konsumen, $barista_lat, $barista_lon, $unit);
               $distanceNew = $this->transformDistance($distance);
               $barista->walking_time = $this->calculate_walking_time($distance, $unit);
            }
         }

         $transformedData = [
            'barista_id' => $barista?->id,
            'user_id' => $barista?->user?->id,
            'nama' => strtoupper($barista->user?->name),
            'foto' => $barista?->user?->foto,
            'path_foto' => url('storage/uploads/barista/' . $barista?->user?->foto),
            'kontak' => $barista?->user?->kontak,
            'distance' => $distanceNew,
            'estimasi' => $barista?->walking_time,
            'lokasi_terkini' => $barista?->gerobak?->lokasi_terkini,
            'latitude' => $barista?->gerobak->latitude,
            'longitude' => $barista?->gerobak->longitude,
            'gerobak_id' => $barista?->gerobak?->id,
            'gerobak_nama' => $barista?->gerobak?->nama,
            'info' => $barista?->info,
            'stok' => $stok,
           
         ];


         return response()->json($transformedData);
      } catch (ModelNotFoundException $e) {
         return $this->error("barista tidak ditemukan", 404);
      }


      return $this->success("List Barista Terdekat", $data);
   }

   public function baristaProduk()
   {

      if (auth()->user()->role != "barista") {
         return $this->error("Akses Tidak diizinkan", 401);
      }
      try {

         $barista = Barista::where('id', auth()->user()->id)->with('gerobak', 'user')->first();

         $stok = GerobakStok::with('produk')->where('gerobak_id', $barista->gerobak?->id)->get();
         $stok->transform(function ($stok) {
            return [
               'produk_id' => $stok->produk?->id,
               'nama' => $stok->produk?->nama,
               'foto' => $stok->produk?->foto,
               'stok' => $stok?->jumlah_stok,
               'harga' => $stok?->produk?->harga,
               'harga_format' =>  "Rp" . Rupiah::toRupiah($stok?->produk?->harga),
            ];
         });
         $transformedData = [
            'barista_id' => $barista?->id,
            'user_id' => $barista?->user?->id,
            'nama' => strtoupper($barista?->user?->name),
            'foto' => $barista?->user?->foto,
            'kontak' => $barista?->user?->kontak,
            'gerobak_id' => $barista?->gerobak?->id,
            'gerobak_nama' => $barista?->gerobak?->nama,
            'info' => '',
            'stok' => $stok
         ];


         return response()->json($transformedData);
      } catch (ModelNotFoundException $e) {
         return $this->error("barista tidak ditemukan", 404);
      }


      return $this->success("List Barista Terdekat", $data);
   }

   function lokasiUpdate(LokasiUpdateRequestAPI $request)
   {
      try {
         DB::beginTransaction();

         if (auth()->user()->role != "barista") {
            return $this->error("Akses Tidak diizinkan", 401);
         }

         $requestSafe = $request->safe();
         $gerobak = Gerobak::find(auth()->user()->id);

         HistoriLokasi::create([
            'users_id' => auth()->user()->id,
            'gerobak_id' => $gerobak?->id,
            'gerobak_nama' => $gerobak?->nama,
            'barista_id' => $gerobak?->barista_id,
            'latitude' => $requestSafe->latitude,
            'longitude' => $requestSafe->longitude,
            'lokasi_terkini' => $requestSafe->lokasi_terkini,

            'latitude_before' => $gerobak->latitude,
            'longitude_before' => $gerobak->longitude,
            'lokasi_terkini_before' => $gerobak->lokasi_terkini,
         ]);

         $gerobak->update([
            'latitude' => $requestSafe->latitude,
            'longitude' => $requestSafe->longitude,
            'lokasi_terkini' => $requestSafe->lokasi_terkini,
         ]);


    

      

         DB::commit();
         return $this->success("Update Lokasi Berhasil", "");
      } catch (Exception $th) {
         DB::rollBack();
         return $this->error("Gagal", 400);
      }
   }


   function lokasiHistori()
   {
      try {
         
       
         $historilokasi = HistoriLokasi::where('users_id', auth()->user()->id)->orderBy('created_at', 'desc')->get();
         return $this->success("Histori Lokasi Barista",  $historilokasi);
      } catch (Exception $th) {
         return $this->error("Gagal", 400);
      }
   }


   function updateInfoStatus(BaristaInfoStatusRequestAPI $request) {
      try {
         DB::beginTransaction();

         if (auth()->user()->role != "barista") {
            return $this->error("Akses Tidak diizinkan", 401);
         }

         $requestSafe = $request->safe();
         Barista::where('id', auth()->user()->id)->update([
            'info' => $requestSafe->info,
         ]);
         DB::commit();
         return $this->success("Update Info Barista Berhasil");
      } catch (Exception $th) {
         DB::rollBack();
         return $this->error("Gagal", 400);
      }

   }


   
}
