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