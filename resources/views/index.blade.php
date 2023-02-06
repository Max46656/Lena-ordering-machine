@extends('layouts.master')
@section('content')
<div class="" id="c">
  <div class=" select_data flex justify-center" style="padding-top:160px" >
    @if ($isAdmin)
    <div class="add-edit py-4 ">
      <a href="{{ route('addRes') }}"><button type="button" class="btn py-3 px-6  mx-4 bg-blue-300 hover:bg-blue-400  rounded-lg" >新增餐廳</button></a>
      <a href="{{ route('addMenu') }}"><button type="button" class="btn py-3 px-6 mx-4 bg-yellow-200  hover:bg-yellow-300 rounded-lg">編輯菜單</button></a>
    </div>
    @endif
    <form class="flex py-4 px-6  mx-4 " action="{{ url('searchRestaurant') }}" method="get">
      <p> <input  type="text"  class="btn" name="search" id=""></p>
      <p><button type="button" class="btn py-3 px-6  mx-4 bg-blue-300 hover:bg-blue-400  rounded-lg">搜尋</button></p>
    </form>
  </div>
  <div class="">
    @include('flash::message')
    <hr>
  </div>
</div>
<div class=" container mx-auto  " style="" >
  <div class="flex flex-wrap ">
    @foreach ($items as $item)
    <div class="card_content mx-auto my-8"  >
      @if (session('restaurant') == $item->id && !empty(session('restaurant')))
      @include('inculd.index._haveToday_already')
    @else
    @include('inculd.index._default')
  @endif
  @endforeach
  </div>

  </div>

{{ $items->links('vendor.pagination.tailwind') }}
@endsection
</div>