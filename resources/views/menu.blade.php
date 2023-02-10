@extends('layouts.master')
@section('content')
<div class="container  mx-auto">
  <div class="row" style="padding-top:150px">

    <div class="mover_anmition">
      <a href="{{ route('clearCart') }}"><button type="button"
          class="btn py-3 px-6 my-4 ml-8 bg-red-300 hover:bg-red-400 active:bg-red-600 rounded-lg">清除購物車</button></a>
      <a href="{{ route('CartPage') }}"><button type="button"
          class="btn py-3 px-6 my-4 ml-8 bg-yellow-200 hover:bg-yellow-300 active:bg-yellow-600 rounded-lg">目前購物車</button></a>
    </div>
    <div class="pl-8 pb-8 mover_anmition_title">
      <div class="">
        <div class="card_font_title">
          <h1> 店名:{{ $res->name }}</h1>
        </div>
        <div class="">
          @php
          $resArr = $resId . $userId;
          @endphp
          @if (!in_array($resArr, $favoriteArr))
          <form action="{{ url('addFavoriteRestaurant') }}" method="get">
            <input type="hidden" name="favorite" value="{{ $res->id }}">
            <button id="heart" style="border: none; font-size: 60px; background: none; color:gray;">❤</button>
          </form>
          @else
          <form action="{{ url('deleteFavoriteRestaurant') }}" method="get">
            <input type="hidden" name="favorite" value="{{ $res->id }}">
            <button id="heart" style="border: none; font-size: 60px; background: none; color:red">❤</button>
          </form>
          @endif

        </div>
      </div>

      <h3 class="detail"> 平均:{{ $res->rate }}★</h3>
      <h2 class="detail">評論:</h2>
      @foreach ($reviews as $review)
      <h2>{{ $review->comment }}</h2>
      <hr>
      @endforeach
    </div>
    @php
    if (\Cart::session(Auth::user()->id)->getTotal() == 0) {
    $fromAction = route('addCart');
    } elseif (session('restaurant') == $res->id && !empty(session('restaurant')) && !empty(session('used'))) {
    $fromAction = route('alreadyOrder');
    } elseif (session('restaurant') != $res->id && !empty(session('restaurant'))) {
    $fromAction = route('wrongMenu');
    } else {
    $fromAction = route('updateCart');
    }
    @endphp
    <div class="card-body mb-8 mover_anmition_menu">
      <form action="{{ $fromAction }}" method="post">
        <input type="hidden" name="resId" value="{{ $resId }}">
        @csrf
        <table class="table w-full">
          <thead>
            <tr class="border-2 border-gray-800 border-opacity-50 ">
              <th class="py-2">#</th>
              <th class="py-2">名字</th>
              <th class="py-2">價格</th>
              <th class="py-2">數量</th>
            </tr>
          </thead>
          <tbody>
            @foreach ($items as $menu)
            <tr class="border-2 border-gray-800 border-opacity-50" style="height: 150px;">
              <th class=" mx-auto inline-block ">
                <div class="order_image mx-4" style="">

                  <img class="image py-4 px-4 " style=" " src="{{ url(Voyager::image($menu->cover)) }}" srcset=""
                    style="" />
              </th>
    </div>
    <th><input type="number" name="id[]" value="{{ $menu->id }}" style="display:none">{{ $menu->id }}</th>
    <th><input type="hidden" name="name[]" id="" value="{{ $menu->name }}">{{ $menu->name }}</th>
    <th><input type="number" name="price[]" value="{{ $menu->price }}" style="display:none">{{ $menu->price }}
    </th>
    <th>
      <livewire:counter />
    </th>
    </tr>
    @endforeach

    </tbody>
    </table>
    <button type="submit"
      class="w-full btn py-3 px-6 my-8  bg-blue-200 hover:bg-blue-300 active:bg-blue-400 rounded-lg">送出</button>
    </form>
  </div>
</div>
</div>
{{-- <div class='blurbg' style='background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),url(asset('
  imge/bg.jpg'));'>
</div> --}}
{{-- <div class="l2d_xb">
  <div class="l2d">
    <div class="l2d-text" style="display: block; opacity: 0.0244717;"></div>
    <canvas id="live2d" width="220" height="250" class="live2d"></canvas>
  </div>
</div> --}}
@endsection