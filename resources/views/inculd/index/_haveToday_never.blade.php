<div class="pro col mb-5  ml-3  text-dark">
    <div class="card mt-4" style="width: 18rem;"">
        <a href="{{ url('/wrongMenu') }}">
            <img src="{{ url(Voyager::image($item->cover)) }}" class="img-fluid" alt="" srcset=""
                style="width:100%" />
            <div class="text-dark">

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
    </div>
    </a>
</div>

{{-- <div class="pro mb-4"> --}}
    {{-- <div class="spro"> --}}
        {{-- <a href="{{ url('/wrongMenu') }}"> --}}
            {{-- <p> --}}
                {{-- {{ $item->name }} --}}
            {{-- </p> --}}
            {{-- <p> --}}
                {{-- url('/menu/'.$item->id) --}}
                {{-- 電話:{{ $item->tel }} --}}
            {{-- </p> --}}
            {{-- <p> --}}
                {{-- 地址:{{ $item->address }} --}}
            {{-- </p> --}}
    {{-- </div> --}}
    {{-- <img src="{{ url(Voyager::image($item->cover)) }}" class="img-fluid" alt="" srcset=""
        style="width: 500px; height: 350px" /> --}}
    {{-- </a> --}}
{{-- </div> --}}