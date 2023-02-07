@extends('layouts.master')
@section('content')

<div class="container  ml-8 pl-8 pt-8"  style="padding-top:150px;margin-bottom:80px">
  <div class=" py-8 mx-auto mt-8" >
    @if (!empty(session('restaurant')))

    <p>{{ $restaurant->name }}</p>
    @endif
    @csrf
    <table  class="border-dotted border-gray-500 mt-8 " >
      <thead>
        <tr>
          <th class="Cart_table">名字</th>
          <th class="Cart_table">菜名</th>
          <th class="Cart_table">價格</th>
          <th class="Cart_table">數量</th>
          <th class="Cart_table">數量*價格</th>
        </tr>
      </thead>
      <tbody  >
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
        <tr >
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
          <td class="Cart_table">{{ $menu->name }}</td>
          <td class="Cart_table">{{ $menu->dish }}</td>
          <td class="Cart_table">{{ $menu->price }}</td>
          <td class="Cart_table">{{ $menu->qty }}</td>
          <td class="Cart_table">{{ $menu->qty * $menu->price }}</td>
        </tr>
        @if ($count == count($menus))
        <tr >
          <th class=" py-2">小記:{{ $num }}</th>
        </tr>
        @endif
        @php
        $name = $menu->name;

        $total += $menu->qty * $menu->price;
        @endphp
        @endforeach
        <tr class=" py-2">
            <th ><h1>總計:{{ $total }}</h1></th>
        </tr>

      </tbody>
    </table>
  </div>
</div>

@endsection