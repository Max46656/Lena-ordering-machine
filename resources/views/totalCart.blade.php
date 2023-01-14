@extends('layouts.master')
@section('content')
    <div class="card container">
        <div class="card-body">
          @if (!empty(session('restaurant')))

          <p>{{ $restaurant->name }}</p>
          @endif
            @csrf
            <table class="table">
                <thead>
                    <tr>
                        <th>名字</th>
                        <th>菜名</th>
                        <th>價格</th>
                        <th>數量</th>
                        <th>數量*價格</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                        $total = 0;
                        $name = $menus[0]->name;
                        $count = 0;
                        $num = 0;
                    @endphp
                    @foreach ($menus as $menu)
                        @php
                            $count++;
                            $num += $menu->qty * $menu->price;
                            if ($name != $menu->name) {
                                $num -= $menu->price;
                            }
                        @endphp

                        @if ($name != $menu->name)
                            <tr>
                                <th colspan="5">小記:{{ $num }}</th>
                            </tr>
                        @endif
                        @php
                            if ($name != $menu->name) {
                                $num = 0;
                                $num+=$menu->price;
                            }
                        @endphp
                        <tr>
                            <th>{{ $menu->name }}</th>
                            <th>{{ $menu->dish }}</th>
                            <th>{{ $menu->price }}</th>
                            <th>{{ $menu->qty }}</th>
                            <th>{{ $menu->qty * $menu->price }}</th>
                        </tr>
                        @if ($count == count($menus))
                            <tr>
                                <th colspan="5">小記:{{ $num }}</th>
                            </tr>
                        @endif
                        @php
                            $name = $menu->name;

                            $total += $menu->qty * $menu->price;
                        @endphp
                    @endforeach

                    <h1>總計:{{ $total }}</h1>

                </tbody>
            </table>
        </div>
    </div>
@endsection
