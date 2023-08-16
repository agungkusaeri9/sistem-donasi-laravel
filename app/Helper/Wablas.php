<?php

namespace App\Helper;

use App\Models\Setting;
use App\Models\Transaction;

class Wablas
{

    public $urlMain;
    private static $url = "https://jogja.wablas.com/api/";
    private static $token = "0ppsqcJvSFVjw7rJaxhJ3XnuV3DXzgnTgYTMedgaktlZY4GKQ6uTGDsZdMH2pboP";


    public static function send($id, $phones, $type)
    {

        $curl = curl_init();
        $token = static::$token;
        if ($type === 'Create') {
            $message = static::messageCreate($id);
        } else {
            $message = static::messageUpdate($id);
        }
        $url = static::$url . 'send-message';
        $data = [
            'phone' => $phones,
            'message' => $message,
        ];
        curl_setopt(
            $curl,
            CURLOPT_HTTPHEADER,
            array(
                "Authorization: $token",
            )
        );
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($curl, CURLOPT_URL,  $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        $result = curl_exec($curl);
        curl_close($curl);
    }

    public static function sendAdmin($id)
    {

        $curl = curl_init();
        $token = static::$token;
        $message = static::messageCreateAdmin($id);
        $url = static::$url . 'send-message';
        $setting = Setting::first();
        $data = [
            'phone' => $setting->phone,
            'message' => $message,
        ];
        curl_setopt(
            $curl,
            CURLOPT_HTTPHEADER,
            array(
                "Authorization: $token",
            )
        );
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($curl, CURLOPT_URL,  $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        $result = curl_exec($curl);
        curl_close($curl);
    }

    private static function messageUpdate($id)
    {
        $item = Transaction::with(['program', 'payment'])->find($id);
        $setting = Setting::first();
        if ($item->is_verified == 1) {
            $status = "Terverifikasi";
        } else {
            $status = "Belum Terverifikasi";
        }
        $mess1 = "Assalamualaikum Warahmatullahi Wabarakatuh, " . "<br>";

        $mess2 = "Transaksi dibawah ini sudah kami verifikasi" . "<br><br>";

        $mess4 = "No. Invoice : #" . $item->code . " <br>";
        $mess5 = "Nama Donatur : " . $item->name . " <br>";
        $mess6 = "Email : " . $item->email . " <br>";
        $mess7 = "Nomor Hp : " . $item->phone_number . " <br>";

        $mess8 = "Program : " . $item->program->name . " <br>";
        $mess9 = "Nominal : Rp. " . number_format($item->nominal) . " <br><br>";

        $mess10 = "Metode Pembayaran : " . $item->payment->name . " <br>";
        $mess11 = "Nomor Rekening : " . $item->payment->number . " <br>";
        $mess12 = "Status : " . $status . " <br><br>";

        $mess13 = "Terima kasih kami ucapkan kepada donatur yang telah menginfakan hartanya di jalan Allah Semoga Allah SWT menggantinya dengan keberkahan yang berlipat ganda dalam segala urusan, dan menjadi amal yang tiada putus di dunia dan akhirat.<br>";

        $mess14 = "Wassalamu'alaikum Warahmatullahi Wabarakatuh. <br><br>Salam Hangat, <br>$setting->site_name";

        $message = $mess1 . $mess2  . $mess4 . $mess5 . $mess6 . $mess7 . $mess8 . $mess9 . $mess10 . $mess11 . $mess12 . $mess13 . $mess14;
        return $message;
    }

    private static function messageCreate($id)
    {
        $item = Transaction::with(['program', 'payment'])->find($id);
        $setting = Setting::first();
        if ($item->is_verified == 1) {
            $status = "Terverifikasi";
        } else {
            $status = "Belum Terverifikasi";
        }
        $mess1 = "Assalamualaikum Warahmatullahi Wabarakatuh, " . "<br>";

        $mess2 = "Silahkan lakukan pembayaran donasimu sebagai berikut : " . "<br><br>";

        $mess4 = "No. Invoice : #" . $item->code . " <br>";
        $mess5 = "Nama Donatur : " . $item->name . " <br>";
        $mess6 = "Email : " . $item->email . " <br>";
        $mess7 = "Nomor Hp : " . $item->phone_number . " <br>";

        $mess8 = "Program : " . $item->program->name . " <br>";
        $mess9 = "Nominal : Rp. " . number_format($item->nominal) . " <br><br>";

        $mess10 = "Metode Pembayaran : " . $item->payment->name . " <br>";
        $mess11 = "Nomor Rekening : " . $item->payment->number . " <br>";
        $mess12 = "Status : " . $status . " <br><br>";

        $mess13 = "Terima kasih kami ucapkan kepada donatur yang telah menginfakan hartanya di jalan Allah Semoga Allah SWT menggantinya dengan keberkahan yang berlipat ganda dalam segala urusan, dan menjadi amal yang tiada putus di dunia dan akhirat.<br>";

        $mess14 = "Wassalamu'alaikum Warahmatullahi Wabarakatuh. <br><br>Salam Hangat, <br>$setting->site_name";

        $message = $mess1 . $mess2  . $mess4 . $mess5 . $mess6 . $mess7 . $mess8 . $mess9 . $mess10 . $mess11 . $mess12 . $mess13 . $mess14;
        return $message;
    }

    private static function messageCreateAdmin($id)
    {
        $item = Transaction::with(['program', 'payment'])->find($id);
        $setting = Setting::first();
        if ($item->is_verified == 1) {
            $status = "Terverifikasi";
        } else {
            $status = "Belum Terverifikasi";
        }
        $mess1 = "Transaksi Baru, " . " <br><br>";

        $mess4 = "No. Invoice : #" . $item->code . " <br>";
        $mess5 = "Nama Donatur : " . $item->name . " <br>";
        $mess6 = "Email : " . $item->email . " <br>";
        $mess7 = "Nomor Hp : " . $item->phone_number . " <br>";

        $mess8 = "Program : " . $item->program->name . " <br>";
        $mess9 = "Nominal : Rp. " . number_format($item->nominal) . " <br><br>";

        $mess10 = "Metode Pembayaran : " . $item->payment->name . " <br>";
        $mess11 = "Nomor Rekening : " . $item->payment->number . " <br>";
        $mess12 = "Status : " . $status . " <br><br>";
        $mess2 = "Silahkan cek pembayarannya dan jangan lupa update jika terverifikasi." . "<br><br>";

        $message = $mess1   . $mess4 . $mess5 . $mess6 . $mess7 . $mess8 . $mess9 . $mess10 . $mess11 . $mess12 . $mess2;
        return $message;
    }
}
