<div class="pro  int mb-5  ml-3 ">
    <div class="card  col  mt-4" style="width: 18rem;">
        <a href="{{ route('getMenu', ['id' => $item->id]) }}">
            <img src="{{ url(Voyager::image($item->cover)) }}" class="card-img-top" alt=" ">
            <div class="card-body text-left text-dark ">
               
                <h4 class="card-title">  {{ $item->name }}</h4>
                <p class="card-text ">  電話： {{ $item->tel }}</p>
                <p class="card-text ">  地址： {{ $item->address }}</p>
                {{-- <a href="#" class="btn btn-primary">Go somewhere</a> --}}
              </div>
        </a>
    </div>
   
    
</div>