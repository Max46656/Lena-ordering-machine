@extends('layouts.master')
@section('content')
    <div class="row bg-light" id="c">
        <div class="col-12 text-center mt-4  ">
            <a href="{{ route('addRes') }}"><button type="button" class="mr-2 btn btn-outline-dark">新增餐廳</button></a>
            <a href="{{ route('addMenu') }}"><button type="button" class="ml-2 btn btn-outline-dark">編輯菜單</button></a>
        </div>
        <div class="col-12">
          @include('flash::message')
            <hr>
        </div>
    </div>
  
    <div class="container d-flex justify-content-centerjustify-content-center " ">
        <div class="row  d-flex justify-content-center   pt-4 m" style="min-width:auto;">
            @foreach ($items as $item)
                <div  class=" col text-center ">
                    @if (session('restaurant') == $item->id && !empty(session('restaurant'))&& empty(session('used')))
                       @include('inculd.index._haveToday_noOrder')
                       {{-- 以選餐廳   還未點餐 --}}
                </div>
                    @elseif (session('restaurant') == $item->id && !empty(session('restaurant'))&& !empty(session('used')))
                       @include('inculd.index._haveToday_already')
                       {{-- 已經選擇餐廳 已經膽過餐無法再點 --}}
                </div>
            @elseif(session('/restaurant') != $item->id && !empty(session('restaurant')))
                @include('inculd.index._haveToday_never') 
                {{-- 最初始 --}}
        </div>
    @else
    
        @include('inculd.index._haveToday_int')
    </div>
    @endif
    @endforeach

    </div>
    </div>
    
@endsection
