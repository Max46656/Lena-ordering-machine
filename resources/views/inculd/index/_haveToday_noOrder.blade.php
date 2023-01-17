
<div class="col  mb-5  ml-3" style="">
    <div class="card   mt-4" style="width: 18rem;">
        <a href="{{ route('getMenu', ['id' => $item->id]) }}">
            <img src="{{ url(Voyager::image($item->cover)) }}" class="card-img-top" alt=""
                srcset=""  />
            <div class="card-body text-left text-dark ">
                <h4 class="card-title">
                {{ $item->name }}
                </h4>
                <p class="card-text ">
                {{-- url('/menu/'.$item->id) --}}
                電話:{{ $item->tel }}
                </p>
                <p class="card-text ">
                地址:{{ $item->address }}
                </p>
            </div> 
    </div>
        </a>
    </div>
