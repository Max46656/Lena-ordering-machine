<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
</head>

<body>
  <div>
    <a href="{{ route('clearCart') }}"><button>清除購物車</button></a>
    <a href="{{ url()->previous() }}"><button>回菜單加點</button></a>
  </div>
  <table>
    <tbody>
      @foreach ($cart as $item)
      <td>
        名稱{{$item->name}}<br>
        價格{{$item->price}}<br>
        數量{{$item->quantity}}<br>
        小記{{$item->quantity*$item->price}}<br>
      </td>
      @endforeach
      <tr>
        <td>總價{{$total}}</td>
      </tr>
    </tbody>
  </table>
</body>

</html>