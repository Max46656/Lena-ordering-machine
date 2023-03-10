<!doctype html>
<html lang="zh-Hant-TW">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Author -->
  <meta name="author" content="MaxCaulfield">
  <meta name="author" content="曾俊澄">
  <meta name="author" content="朱翊榕">
  <meta name="designer" content="謝婧琳">
  <!--
 __  __                 _____                _   __  _        _      _
|  \/  |               / ____|              | | / _|(_)      | |    | |
| \  / |  __ _ __  __ | |       __ _  _   _ | || |_  _   ___ | |  __| |
| |\/| | / _` |\ \/ / | |      / _` || | | || ||  _|| | / _ \| | / _` |
| |  | || (_| | >  <  | |____ | (_| || |_| || || |  | ||  __/| || (_| |
|_|  |_| \__,_|/_/\_\  \_____| \__,_| \__,_||_||_|  |_| \___||_| \__,_|
Contact me: https://github.com/Max46656
Check readme.md for more information.
-->
  <!-- Tailwind CSS-->
  @vite('resources/css/app.css')
  <link rel="stylesheet" href="{{ asset('css/css.css') }}" />
  {{--
  <link rel="stylesheet" href="css/normalize.css">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
    integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
  <!-- jQuery 3.2.1-->
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"
    integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  <!-- Animate.css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script> --}}
  <link href="{{ asset('css/app.css') }}" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
    integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
  <link rel="shortcut icon" href="imge/agyop-qczih-001.ico" type="image/x-icon" />
  <title>Binging with Babish</title>
  @livewireStyles
</head>

<body data-spy="scroll" data-target="#navspy" data-offset="100">
  {{-- <div class="progress">
    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75"
      aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
  </div>

  <div class="content"> --}}
    <!-- BAR -->
    <div class="wrapper">
      <div class="header fixed  opacity-90 ">
        <div class=" navbar container flex  justify-between">
          <div class="nav-left ">
            <div class="logo">
              <a href={{route("index")}}>
                <img src="{{asset('imge/icon1.png')}}" alt="">
              </a>
            </div>
          </div>
          <div class="nav-right mt-8 text-gray-600">
            <ul>
              <li class="nav-link">
                <a href="{{ route('addFavorite') }}" class="nav-item ">我的最愛</a>
              </li>
              <li class="nav-link ">
                <a href="{{ route('index') }}" class="nav-item  ">餐廳</a>
              </li>
              <li class="nav-link ">
                @if (!empty(session('restaurant'))&&empty(session('used')))
                <a class="nav-link" href="{{route('getMenu', ['id'=>session('restaurant')]) }}">今日餐廳</a>
                @elseif(!empty(session('used')))
                <a class="nav-link" href="{{route('alreadyOrder')}}">今日餐廳</a>
                @else
                <a class="nav-link" href="#c">今日餐廳</a>
                @endif
              <li class="nav-link">
                <a href="{{ route('CartPage') }}" class="nav-item ">我的訂單</a>
              </li>
              <li class="nav-link">
                <a href="{{ route('totalCart') }}" class="nav-item ">今日總訂單</a>
              </li>
              <li>
                <div class=" justify-end flex ">
                  @if (Route::has('login'))
                  <div class=" ">
                    <form method="POST" action="{{route('logout') }}">
                      @csrf
                      <a href="{{ route('logout') }}"
                        class="text-sm text-gray-600 hover:text-red-500 dark:text-gray-500 " style="font-size: 25px"
                        onclick="event.preventDefault();this.closest('form').submit();">
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

        {{-- bootstrap5--------------------------- --}}

        {{-- <nav id="navspy" class="navbar navbar-expand-lg navbar-light sticky-top ">
          <a class="navbar-brand row" href="#">
            <!-- <img class="col-6 p-0"src="imge/logo.gif"width="60%" height="60%" alt="" style="margin: 0 20px;"> -->

          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto  text-center">
              <li class="nav-item  text-current" style=" ">
                <a class="nav-link   text-red-" href="{{ url('/favoriteRestaurant') }}">我的最愛</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="{{ url('/') }}">餐廳</a>
              </li>
              <li class="nav-item">
                @if (!empty(session('restaurant'))&&empty(session('used')))
                <a class="nav-link" href="{{ url('menu', [session('restaurant')]) }}">今日餐廳</a>
                @elseif(!empty(session('used')))

                <a class="nav-link" href="{{url('alreadyOrder')}}">今日餐廳</a>
                @else
                <a class="nav-link" href="#c">今日餐廳</a>
                @endif
              </li>
              <li>
                <a class="nav-link" href="{{ url('/cart') }}">我的訂單</a>
              </li>
              <li>
                <a class="nav-link" href="{{ url('/totalCart') }}">今日總訂單</a>
              </li>
              <div
                class="relative flex items-top justify-center min-h-screen bg-gray-100 dark:bg-gray-900 sm:items-center py-1 sm:pt-0">
                @if (Route::has('login'))
                <div class="hidden fixed top-0 right-0 sm:block">
                  <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <a href="{{ route('logout') }}" class="text-sm text-gray-700 dark:text-gray-500 underline"
                      onclick="event.preventDefault();this.closest('form').submit();">
                      登出</a>
                  </form>
                  @auth
                  <a href="{{ url('/dashboard') }}" class="text-sm text-gray-700 dark:text-gray-500 underline">{{
                    session('name') }}</a>
                  @else
                  <a href="{{ route('login') }}" class="text-sm text-gray-700 dark:text-gray-500 underline">Log in</a>

                  @if (Route::has('register'))
                  <a href="{{ route('register') }}"
                    class="ml-4 text-sm text-gray-700 dark:text-gray-500 underline">Register</a>
                  @endif
                  @endauth
                </div>
                @endif
            </ul>
          </div>
        </nav> --}}
      </div>


      <div class="container-fluid">
        @yield('content')
        <div class="tt">


        </div>

      </div>
      <!-- 聯絡我 -->


      <!-- 頁尾 -->
      <footer class="pcolor page-f ">
        <div class="row ">
          <div class="col text-center">copyRight@teamMaxCaulfield</div>
        </div>
      </footer>
    </div>

    <div id="toTop"></div>
  </div>
  <script>
    <!-- Flash Message Overlay會用到，需保留
    -->
    $('#flash-overlay-modal').modal();

  <!-- Flash Message 3秒之後消失，非必須 -->
  $('div.alert').delay(3000).fadeOut(350);

  </script>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
        // (function() {
        //     'use strict';
        //     window.addEventListener('load', function() {
        //         // Fetch all the forms we want to apply custom Bootstrap validation styles to
        //         var forms = document.getElementsByClassName('a');
        //         // Loop over them and prevent submission
        //         var validation = Array.prototype.filter.call(forms, function(form) {
        //             form.addEventListener('submit', function(event) {
        //                 if (form.checkValidity() === false) {
        //                     event.preventDefault();
        //                     event.stopPropagation();
        //                 }
        //                 form.classList.add('was-validated');
        //             }, false);
        //         });
        //     }, false);


        //     $(".progress").width(500).fadeOut(1000, function() {
        //         $(".content").fadeIn(1000)
        //     })
        //     $('#list-tab a').on('click', function(e) {
        //         e.preventDefault()
        //         $(this).tab('show')
        //         // $('#list-tab a[href="#list-profile"]').tab('show')
        //     })

        //     $(document).scroll(function() { //開始捲動

        //         if ($(this).scrollTop()) { //如果捲軸拉到了最上方，按鈕淡出
        //             $('#toTop').fadeIn();
        //         } else { //如果捲軸拉開了最上方，按鈕淡入
        //             $('#toTop').fadeOut();
        //         }



        //         if ($(this).scrollTop() > ($("#b").offset().top) - 73) { //如果視窗的捲動到了#about區塊的上方

        //             $("#navspy").css('transition', 'background 0.5s linear'); //背景顏色淡入
        //             $("#navspy").css('background-color', 'rgba(50, 50, 50, 0.6)');
        //         } else { //如果視窗的捲動沒有到了#about區塊的上方
        //             $("#navspy").css('background-color', '#0b2626');

        //         }
        //     });

        //     //點選按鈕頁面自動捲到最上方
        //     $("#toTop").click(function() {
        //         $("html, body").animate({
        //             scrollTop: 0
        //         }, 1000);
        //     });

        //     //選單點選滑動效果
        //     $("#navspy li a[href^='#']").on('click', function(e) {

        //         // hash是設定連結#字後面的文字內容
        //         var target;
        //         target = this.hash;

        //         // 連結效果取消
        //         e.preventDefault();

        //         // 將導覽列的高度儲存在navOffset變數裡
        //         var navOffset;
        //         navOffset = $('#navspy').height();

        //         // 捲軸滑動開始
        //         $('html, body').animate({
        //             scrollTop: $(this.hash).offset().top - navOffset
        //         }, 600, function() {

        //             // 增加#字後面的文字內容到URL的最後面
        //             return window.history.pushState(null, null, target);

        //         });

        //     });

        //     $('.pro').mouseover(function() {
        //         $(this).append("<style>.pro::before{ font-size:60px }</style>");
        //     })
        //     /* .... */
        //     new WOW().init();
        //     /* ..... */
        //     $('#nav-tabContent div:first-child').addClass('show').addClass('active')
        //     $('#list-tab a:first-child').addClass('active')
        //     /* .... */

        // })();
  </script>


  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
    integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous">
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
    integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous">
  </script>
  @livewireScripts
</body>

</html>