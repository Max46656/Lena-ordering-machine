@extends('layouts.master')
@section('content')
   
        <div class="col-12">
          @include('flash::message')
            <hr>
        </div>
    </div>
    <div class="pcolor row justify-content-center" style="color: white;">

        <div class="row justify-content-center pt-4" style="width:1200px;">
            @foreach ($items as $item)
                <div style="
                /* max-width: 500px; */
                /* max-height: 360px; */
                visibility: visible;
                animation-name: hinge;
              "
                    class="col-12 col-md-6 text-center wow hinge">
                    @if (session('restaurant') == $item->id && !empty(session('restaurant'))&& empty(session('used')))
                        <div class="pro mb-4" style="border:solid rgb(255, 238, 0) 5px">
                            <div class="spro">
                                <a href="{{ route('getMenu', ['id' => $item->id]) }}">
                                    <p>
                                        {{ $item->name }}
                                    </p>
                                    <p>
                                        {{-- url('/menu/'.$item->id) --}}
                                        電話:{{ $item->tel }}
                                    </p>
                                    <p>
                                        地址:{{ $item->address }}
                                    </p>
                            </div>
                            <img src="{{ url(Voyager::image($item->cover)) }}" class="img-fluid" alt=""
                                srcset="" style="" />
                            </a>
                        </div>ㄑ
                </div>
                    @elseif (session('restaurant') == $item->id && !empty(session('restaurant'))&& !empty(session('used')))
                        <div class="pro mb-4" style="border:solid red 5px">
                            <div class="spro">
                                <a href="{{ route('oreadyOrder') }}">
                                    <p>
                                        {{ $item->name }}
                                    </p>
                                    <p>
                                        {{-- url('/menu/'.$item->id) --}}
                                        電話:{{ $item->tel }}
                                    </p>
                                    <p>
                                        地址:{{ $item->address }}
                                    </p>
                            </div>
                            <img src="{{ url(Voyager::image($item->cover)) }}" class="img-fluid" alt=""
                                srcset="" style="width: 500px; height: 350px" />
                            </a>
                        </div>
                </div>
            @elseif(session('restaurant') != $item->id && !empty(session('restaurant')))
                <div class="pro mb-4">
                    <div class="spro">
                        <a href="{{ url('/wrongMenu') }}">
                            <p>
                                {{ $item->name }}
                            </p>
                            <p>
                                {{-- url('/menu/'.$item->id) --}}
                                電話:{{ $item->tel }}
                            </p>
                            <p>
                                地址:{{ $item->address }}
                            </p>
                    </div>
                    <img src="{{ url(Voyager::image($item->cover)) }}" class="img-fluid" alt="" srcset=""
                        style="" />
                    </a>
                </div>
        </div>
    @else
        <div class="pro mb-4 card">
            <div class="spro">
                <a href="{{ route('getMenu', ['id' => $item->id]) }}">
                    <p>
                        {{ $item->name }}
                    </p>
                    <p>
                        {{-- url('/menu/'.$item->id) --}}
                        電話:{{ $item->tel }}
                    </p>
                    <p>
                        地址:{{ $item->address }}
                    </p>
            </div>
            <img src="{{ url(Voyager::image($item->cover)) }}" class="img-fluid" alt="" srcset=""
                style="" />
            </a>
        </div>
    </div>
    @endif
    @endforeach
  

    </div>
    </div>
    {{-- <div class="row" id="c">
        <div class="col-12 text-center" style="margin: 30px 0 3px 0;">
            <a href="{{ route('addRes') }}"><button type="button" class="btn btn-primary">新增餐廳</button></a>
            <a href="{{ route('addMenu') }}"><button type="button" class="btn btn-warning">編輯菜單</button></a>
        </div> --}}
@endsection
