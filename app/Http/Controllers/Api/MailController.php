<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\OnDuty;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use PDOException;

class MailController extends Controller
{

    public function sendMail(Request $request)
    {
        $allPerson = ['bgirl0123456789@gmail.com' => 0, 'maxfromsea36@gmail.com' => 1, 'lily70233@yahoo.com.tw' => 2];
        $PersonOnDuty = array_rand($allPerson);
        // 測試時修改以下變數
        $PersonOnDuty = 'maxfromsea36@gmail.com';
        dd($PersonOnDuty);
        $this->saveOnDuty($PersonOnDuty);

        $data = $request->all();
        //Laravel Mail 使用方法可參考：https://laravel.com/docs/5.1/mail#sending-mail

        $data = $request->all();
        Mail::send('email.mail', $data, function ($message)
             use ($data, $PersonOnDuty) {
                $message->from(env('MAIL_USERNAME', 'bGirl'), $data['name']);
                $message->to(env('MAIL_SUPPORT', $PersonOnDuty))->subject('Order');
            });
        return "success";
    }
    public function saveOnDuty($email)
    {
        try {
            $data = User::where('email', '=', $email);
            $OnDuty = new OnDuty;
            $OnDuty->save($data);
        } catch (PDOException $e) {
            return $e->getMessage();
        }
    }
}