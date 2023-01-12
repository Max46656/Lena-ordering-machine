<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
</head>
<body>
  @foreach ($cart as $item)
  <div>
    {{$item->name}}
    {{$item->price}}
    {{$item->quantity}}
    {{$item->quantity*$item->price}}
  </div>
  @endforeach
</body>
</html>
