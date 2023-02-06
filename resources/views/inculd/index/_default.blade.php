<div class="card " style=" ">
    <a href="{{ route('getMenu', ['id' => $item->id]) }}">
    <img class="bg-no-repeat  bg-auto img-fluid" src="{{ url(Voyager::image($item->cover)) }}"  alt="" srcset=""
       />
      <div class=" pl-10">
        <h1 class= "card_font_title font-semibold mb-2 ">
          {{ $item->name }}
        </h1>
        <p class="detail my-2 ">
          {{-- url('/menu/'.$item->id) --}}
          電話:{{ $item->tel }}
        </p>
        <p class="detail my-2 ">
          地址:{{ $item->address }}
        </p>
      </a>
    </div>

    @php
    $resArr = $item->id . $userId;
    @endphp
    @if (in_array($resArr, $reviewArr))
    <p>
      <a href="{{ url('editEvaluate/' . $item->id . '/' . $userId) }}">評價</a>
    </p>
    @else
    <button type="button" class="btn py-3 px-6  my-4 ml-8 bg-blue-300 hover:bg-blue-400  rounded-lg">
      <a href="{{ url('evaluate/' . $item->id) }}">評價</a>
    </button>
    @endif

  </div>
</div>




