@extends('layouts.master')
@section('content')
<div class="row" id="c">
  <div class="col-12 text-center" style="margin: 30px 0 3px 0;">
    <a href="{{ route('addRes') }}"><button type="button" class="btn btn-primary">新增餐廳</button></a>
    <a href="{{ route('addMenu') }}"><button type="button" class="btn btn-warning">編輯菜單</button></a>
  </div>
  <div class="col-12">
    <hr>
  </div>
</div>
<div class="pcolor row justify-content-center" style="color: white;">

  <div class="row justify-content-center pt-4" style="width:1200px;">
    @foreach ($items as $item)
    <div style="
                max-width: 500px;
                max-height: 400px;
                visibility: visible;
                animation-name: hinge;
              " class="col-12 col-md-6 text-center wow hinge">
      <div class="pro mb-4">
        <div class="spro">
          <a href="{{ route('getMenu',[$item->id]) }}" target="_blank">{{$item->title}}</a>
          <p>
            電話:{{$item->tel}}
          </p>
          <p>
            地址:{{$item->address}}
          </p>
        </div>
        <img src="{{ Voyager::image($item->cover) }}" class="img-fluid" alt="" srcset=""
          style="width: 500px; height: 400px" />
      </div>
    </div>
    @endforeach

  </div>
</div>
@endsection