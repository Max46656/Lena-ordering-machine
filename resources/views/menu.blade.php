@extends('layouts.master')
@section('content')
    <div class="card container">
        <div>
            <a href="{{ route('clearCart') }}"><button>清除購物車</button></a>
            <a href="{{ route('CartPage') }}"><button>目前購物車</button></a>
        </div>
        <div class="container">
          <div class="row justify-content-between">

          </div>
            <h1> 店名:{{ $res->name }}</h1>
            <h3> 平均:{{ $res->rate }}★</h3>
            <h2>評論:</h2>
            @foreach ($reviews as $review)

            <h2>{{$review->comment}}</h2>
            <hr>
            @endforeach
        </div>
        @php
            if (\Cart::session(Auth::user()->id)->getTotal() == 0) {
                $fromAction = route('addCart');
            } else {
                $fromAction = route('updateCart');
            }
        @endphp
        <div class="card-body">
            <form action="{{ $fromAction }}" method="post">
                <input type="hidden" name="resId" value="{{ $resId }}">
                @csrf
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>名字</th>
                            <th>價格</th>
                            <th>數量</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($items as $menu)
                            <tr>
                                <th><img src="{{ url(Voyager::image($menu->cover)) }}" class="img-fluid" alt=""
                                        srcset="" style="width: 100px; height: auto" /></th>
                                <th><input type="number" name="id[]" value="{{ $menu->id }}"
                                        style="display:none">{{ $menu->id }}</th>
                                <th><input type="hidden" name="name[]" id=""
                                        value="{{ $menu->name }}">{{ $menu->name }}</th>
                                <th><input type="number" name="price[]" value="{{ $menu->price }}"
                                        style="display:none">{{ $menu->price }}</th>
                                <th>
                                    <livewire:counter />
                                </th>
                            </tr>
                        @endforeach

                    </tbody>
                </table>
                <button type="submit" class="btn btn-primary container">送出</button>
            </form>
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
