<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Models\OnDuty;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use PDOException;

class MailController extends Controller
{
    public function sendMail(Request $request)
    {
        
        $allPerson = ['bgirl0123456789@gmail.com' => 0, 'maxfromsea36@gmail.com' => 1, 'lily70233@yahoo.com.tw' => 2];
        $PersonOnDuty = array_rand($allPerson);
        $OnDuty = User::where('email', '=', $PersonOnDuty);
        $data = $request->all();
        //Laravel Mail 使用方法可參考：https://laravel.com/docs/5.1/mail#sending-mail
        Mail::send('email.mail', $data, function ($message) use ($data, $PersonOnDuty) {
            $message->from(env('MAIL_USERNAME', 'bgirl0123456789@gmail.com'), $data['name']);
            $message->to(env('MAIL_SUPPORT', $PersonOnDuty))->subject("Order");
        });
        return "success";
    }
    public function saveOnDuty(OnDuty $OnDuty , $email){
        $data = User::where('email', '=', $email);
        $OnDuty  = new OnDuty;
        $OnDuty->save($data);
        try{
            User::where('email', '=', $email);
        }catch(PDOException $e){
            return $e->getMessage();
        }

    }
}
