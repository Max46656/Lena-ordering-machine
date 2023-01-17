@extends('layouts.master')
@section('content')
<div class="row" id="c">
  <div class="col-12 text-center" style="margin: 30px 0 3px 0;">
    <form action="{{ url('searchRestaurant') }}" method="get">
      <p> <input type="text" name="search" id=""></p>
      <p><button>搜尋</button></p>
    </form>
  </div>
  <div class="col-12">
    @include('flash::message')
    <hr>
  </div>
</div>
<div class="pcolor row justify-content-center" style="color: white;">
  <div class="row justify-content-center pt-4" style="width:1200px;">
    @foreach ($newItems as $item)
    <div style="
                max-width: 500px;
                max-height: 360px;
                visibility: visible;
                animation-name: hinge;" class="col-12 col-md-6 text-center wow hinge">
      @if (session('restaurant') == $item->id && !empty(session('restaurant')))
      <div class="pro mb-4" style="border:solid red 5px">
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
          style="width: 500px; height: 350px" />
        </a>
        @php
        $resArr = $item->id . $userId['id'];
        @endphp
        @if (in_array($resArr, $reviewArr))
        <p>
          <a href="{{ url('editEvaluate/' . $item->id . '/' . $userId['id']) }}">評價</a>
        </p>
        @else
        <p>
          <a href="{{ url('evaluate/' . $item->id) }}">評價</a>
        </p>
        @endif
      </div>
    </div>
    @else
    <div class="pro mb-4">
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
        style="width: 500px; height: 350px" />
      </a>
      @php
      $resArr = $item->id . $userId['id'];
      @endphp
      @if (in_array($resArr, $reviewArr))
      <p>
        <a href="{{ url('editEvaluate/' . $item->id . '/' . $userId['id']) }}">評價</a>
      </p>
      @else
      <p>
        <a href="{{ url('evaluate/' . $item->id) }}">評價</a>
      </p>
      @endif

    </div>
  </div>
  @endif
  @endforeach
</div>
</div>
{{ $items->links() }}
@endsection