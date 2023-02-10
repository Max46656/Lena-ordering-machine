<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  @vite('resources/css/app.css')
  <link rel="stylesheet" href="{{ asset('css/css.css') }}">
  <title>Order</title>

  <!-- Bootstrap CDN-->
  {{--
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> --}}

  <!-- Jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>

  <!-- Font awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
    integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

  <!-- CSS -->
  <style>
    /* .page {
      display: inline-flex;
      justify-content: center;
    }  */

    input,
    textarea {
      margin: 1rem 0;
    }


    .success {
      width: 500px;
      margin: 5rem 0;
      text-align: center;
    }
  </style>
</head>

<div class="wrapper">
  <div class="header fixed backdrop-opacity-0  ">
    <div class=" navbar container flex  justify-between">
      <div class="nav-left ">
        <div class="logo">
          <a href="#">
            <img src="{{asset('imge/icon1.png')}}" alt="">
          </a>
        </div>
      </div>
      <div class="nav-right mt-8 text-gray-600">
        <ul>
          <li class="nav-link">
            <a href="{{ url('/favoriteRestaurant') }}" class="nav-item ">我的最愛</a>
          </li>
          <li class="nav-link ">
            <a href="{{ url('/') }}" class="nav-item  ">餐廳</a>
          </li>
          <li class="nav-link ">
            @if (!empty(session('restaurant'))&&empty(session('used')))
            <a class="nav-link" href="{{ url('menu', [session('restaurant')]) }}">今日餐廳</a>
            @elseif(!empty(session('used')))

            <a class="nav-link" href="{{url('alreadyOrder')}}">今日餐廳</a>
            @else
            <a class="nav-link" href="#c">今日餐廳</a>
            @endif
          <li class="nav-link">
            <a href="{{ url('/cart') }}" class="nav-item ">我的訂單</a>
          </li>
          <li class="nav-link">
            <a href="{{ url('/totalCart') }}" class="nav-item ">今日總訂單</a>
          </li>
          <li>
            <div class=" justify-end flex ">
              @if (Route::has('login'))
              <div class=" ">
                <form method="POST" action="{{ route('logout') }}">
                  @csrf
                  <a href="{{ route('logout') }}" class="text-sm text-gray-600 hover:text-red-500 dark:text-gray-500 "
                    style="font-size: 25px" onclick="event.preventDefault();this.closest('form').submit();">
                    登出</a>
                  @auth
                  <a href="{{ url('/dashboard') }}" class="text-sm text-gray-700 dark:text-gray-500 ">{{
                    session('name') }}</a>
                  @else
                  <a href="{{ route('login') }}" class="text-sm text-gray-700 dark:text-gray-500 ">Log in</a>

                  @if (Route::has('register'))
                  <a href="{{ route('register') }}"
                    class="ml-4 text-sm text-gray-700 dark:text-gray-500 underline">Register</a>
                  @endif
                  @endauth
                </form>
              </div>
              @endif
          </li>
        </ul>
      </div>
    </div>
    <div class="container mx-auto pt-8">
    </div>
    <div class=" pt-8 " style=" ">
      <div>

        <a href="{{ route('index') }}"><button type="button"
            class="btn py-3 px-6 my-4 ml-8 bg-blue-300 hover:bg-blue-400  active:bg-blue-600 rounded-lg">回首頁</button></a>
        @if (empty(session('used')))
        <a href="{{ route('clearCart') }}"><button type="button"
            class="btn py-3 px-6 my-4 ml-8 bg-red-300 hover:bg-red-400 active:bg-red-600 rounded-lg">清除購物車</button></a>
        <a href="{{ url()->previous() }}"><button type="button"
            class="btn py-3 px-6 my-4 ml-8 bg-yellow-200 hover:bg-yellow-300 active:bg-yellow-600 rounded-lg">回菜單修改</button></a>
        @endif
      </div>
      <form action="{{ route('storeCart') }}" method="get">
        @csrf
        <table>
          <tbody>
            @php
            $content = '';
            @endphp
            @foreach ($cart as $item)
            <tr class="tr_style_cart">
              <td>
                名稱:{{ $item->name }}<br>
                價格:{{ $item->price }}<br>
                數量:{{ $item->quantity }}<br>
                小記:{{ $item->quantity * $item->price }}<br>
              </td>
            </tr>
            @php
            $content .= '名稱:' . $item->name . '。';
            $content .= '價格:' . $item->price . '。';
            $content .= '數量:' . $item->quantity . '。';
            $content .= '小記:' . $item->quantity * $item->price . '。';
            $content .= '<br>';
            @endphp
            <input type="hidden" name="item_id[]" value="{{ $item->id }}">
            <input type="hidden" name="quantity[]" value="{{ $item->quantity }}">
            @endforeach
            @php
            $content .= '總額:' . $total . '。';
            $content .= '<br>';
            $content .= '點餐時間' . date('h:i:sa') . '。';
            @endphp
            <tr class="tr_style_cart">
              <td>總價{{ $total }}</td>
            </tr>
          </tbody>
        </table>
        @if (empty(session('used')))
        <button type="submit"
          class="btn py-3 px-6 my-4 ml-8 bg-blue-300 hover:bg-blue-400  active:bg-blue-600 rounded-lg">確認訂單</button>
        @endif
      </form>
      <div class="container-fluid page">
        <form class="form-group ml-2" id="Order">

          <input class="form-control" type="text" name="name" value="{{ $name }}" style="display:none" />
          <input class="form-control" type="text" name="email" value="{{ $email }}" style="display:none" />
          <textarea class="form-control" name="content" style="display:none" />{{ $content }}</textarea>
          <button class="btn py-3 px-6 my-4 ml-8 bg-blue-300 hover:bg-blue-400  active:bg-blue-600 rounded-lg">
            Send
            <i class="fa fa-spinner fa-spin"></i>
          </button>


          <div class="success">你的訂單已送出!</div>
      </div>
    </div>


    <script>
      $('.success').hide();
    $('.fa-spin').hide();
    $('#Order').submit(function(event) {
        event.preventDefault();
        $('.fa-spin').show();
        $.post('{{ route('sendmail') }}', $("#Order").serialize(), function(data) {
            $('#Order').hide();
            $('.success').show();
        })
    })
    </script>

    </html>