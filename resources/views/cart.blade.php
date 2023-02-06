<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  @vite('resources/css/app.css')
  <title>Order</title>

  <!-- Bootstrap CDN-->
  {{-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> --}}

  <!-- Jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>

  <!-- Font awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
    integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

  <!-- CSS -->
  <style>
    .page {
      display: inline-flex;
      justify-content: center;
    }

    form {
      width: 500px;
      margin: 2rem 0;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    input,
    textarea {
      margin: 1rem 0;
    }

    .title {
      color: gray;
      font-size: 24px;
      font-weight: bold;
    }

    .success {
      width: 500px;
      margin: 5rem 0;
      text-align: center;
    }
  </style>
</head>

<body>

<div class="container mx-auto pt-8" >
<div class=" pt-8 " style=" ">
  <div>

    <a href="{{ route('index') }}"><button type="button" class="btn py-3 px-6 my-4 ml-8 bg-blue-300 hover:bg-blue-400  active:bg-blue-600 rounded-lg">回首頁</button></a>
    @if (empty(session('used')))
    <a href="{{ route('clearCart') }}"><button type="button" class="btn py-3 px-6 my-4 ml-8 bg-red-300 hover:bg-red-400 active:bg-red-600 rounded-lg">清除購物車</button></a>
    <a href="{{ url()->previous() }}"><button type="button" class="btn py-3 px-6 my-4 ml-8 bg-yellow-200 hover:bg-yellow-300 active:bg-yellow-600 rounded-lg">回菜單修改</button></a>
    @endif
  </div>
  <form action="{{ route('storeCart') }}" method="get">
    @csrf
    <table>
      <tbody>
        @php
        $content = '';
        @endphp
        @foreach ($cart as $item)
        <tr>
          <td>
            名稱:{{ $item->name }}<br>
            價格:{{ $item->price }}<br>
            數量:{{ $item->quantity }}<br>
            小記:{{ $item->quantity * $item->price }}<br>
          </td>
        </tr>
        @php
        $content .= '名稱:' . $item->name . '。';
        $content .= '價格:' . $item->price . '。';
        $content .= '數量:' . $item->quantity . '。';
        $content .= '小記:' . $item->quantity * $item->price . '。';
        $content .= '<br>';
        @endphp
        <input type="hidden" name="item_id[]" value="{{ $item->id }}">
        <input type="hidden" name="quantity[]" value="{{ $item->quantity }}">
        @endforeach
        @php
        $content .= '總額:' . $total . '。';
        $content .= '<br>';
        $content .= '點餐時間' . date('h:i:sa') . '。';
        @endphp
        <tr>
          <td>總價{{ $total }}</td>
        </tr>
      </tbody>
    </table>
    @if (empty(session('used')))
    <button>確認訂單</button>
    @endif
  </form>
  <div class="container-fluid page">
    <form class="form-group" id="Order">
      <div class="title">Order</div>
      <input class="form-control" type="text" name="name" value="{{ $name }}" style="display:none" />
      <input class="form-control" type="text" name="email" value="{{ $email }}" style="display:none" />
      <textarea class="form-control" name="content" style="display:none" />{{ $content }}</textarea>
      <button class="btn py-3 px-6 my-4 ml-8 bg-blue-300 hover:bg-blue-400  active:bg-blue-600 rounded-lg">
        Send
        <i class="fa fa-spinner fa-spin"></i>
      </button>
    </form>

    <div class="success">Thank you for your Order!</div>
  </div>
</div>
</div>
</body>

<script>
  $('.success').hide();
    $('.fa-spin').hide();
    $('#Order').submit(function(event) {
        event.preventDefault();
        $('.fa-spin').show();
        $.post('{{ route('sendmail') }}', $("#Order").serialize(), function(data) {
            $('#Order').hide();
            $('.success').show();
        })
    })
</script>

</html>