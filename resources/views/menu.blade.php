@extends('layouts.master')
@section('content')
    <div class="card container">

        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>

            <form action="{{ url('/add-cart') }}" method="get">
              <input type="hidden" name="resId" value="{{$resId}}">
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
                      @foreach ($menus as $menu)
                          <tr>
                            <th><input type="hidden" name="id[]" value="{{$menu->id}}">{{$menu->id}}</th>
                            <th><input type="hidden" name="name[]" id="" value="{{$menu->name}}">{{$menu->name}}</th>
                            <th><input type="hidden" name="price[]" value="{{$menu->price}}">{{$menu->price}}</th>
                            <th><input type="number" name="quantity[]" id=""></th>

                        </tr>
                      @endforeach

                    </tbody>
                </table>
                <button type="submit" class="btn btn-primary container">送出</button>
            </form>
        </div>
    </div>
    {{-- <div class='blurbg' style='background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),url(asset('imge/bg.jpg'));'>
</div> --}}
    <div class="l2d_xb">
        <div class="l2d">
            <div class="l2d-text" style="display: block; opacity: 0.0244717;"></div>
            <canvas id="live2d" width="220" height="250" class="live2d"></canvas>
        </div>
    </div>
@endsection
