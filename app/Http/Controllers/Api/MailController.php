<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\OnDuty;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use PDOException;

class MailController extends Controller
{
    //Laravel Mail 使用方法可參考：https: //laravel.com/docs/9.x/mail#sending-mail
    public function sendMail(Request $request)
    {
        $data = $request->all();

        // $PersonOnDuty = DB::table('users')
        //     ->inRandomOrder()
        //     ->first();
        // $this->saveOnDuty($PersonOnDuty);
        // $PersonOnDuty = $PersonOnDuty->email;
        // Mail::send('email.mail', $data, function ($message) use ($data, $PersonOnDuty) {
        //     $message->from(env('MAIL_USERNAME', $PersonOnDuty->name), $data['name']);
        //     $message->to(env('MAIL_SUPPORT', $PersonOnDuty->email))->subject('lena order');
        // });
        Mail::send('email.mail', $data, function ($message) use ($data) {
            $message->from(env('MAIL_USERNAME', 'Max'), $data['name']);
            $message->to(env('MAIL_SUPPORT', 'maxfromsea@gmail.com'))->subject('lena order');});
        return "success";
    }

    public function saveOnDuty($user)
    {
        $user[] = null;
        try {
            $user['id'] = $user->id;
            $OnDuty = new OnDuty;
            $OnDuty->save($user);
        } catch (PDOException $e) {
            return $e->getMessage();
        }

    }
}