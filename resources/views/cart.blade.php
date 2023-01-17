<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Order</title>

    <!-- Bootstrap CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- Jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>

    <!-- Font awesome CDN -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
        integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <!-- CSS -->
    <style>
        /* .page {
            display: inline-flex;
            justify-content: center;
        } */

        /* form {
         
            display: flex;
            flex-direction: column;
            align-items: center; 
        } */

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
        .header_select{
            border-bottom: 2px solid rgb(188, 186, 186);
        }
        .from_order_margin{
            margin-top:15%;
           
        }
    </style>
</head>

<body>
<div class="container">

    <div class="header_select my-5 pb-4">
    
        <a href="{{ route('index') }}"><button class="btn btn-outline-dark">回首頁</button></a>
        @if (empty(session('used')))
            <a class="ml-3" href="{{ route('clearCart') }}"><button class="btn btn-outline-dark">清除購物車</button></a>
            <a  class="ml-3" href="{{ url()->previous() }}"><button class="btn btn-outline-dark">回菜單修改</button></a>
        @endif
    </div>
    <form  class ="from_order_margin col-6" style="font-size:px;  font-weight:500;" action="{{ route('storeCart') }}" method="get">
        @csrf
        <table>
            <tbody>
                @php
                    $content = '';
                @endphp

                @foreach ($cart as $item)
                    <tr>
                        
                        <td>
                            
                            <p>名稱:{{ $item->name }}</p>
                                
                            <p>價格:{{ $item->price }}</p>
                                
                                <p>數量:{{ $item->quantity }}</p>
                                
                                    <p>小記:{{ $item->quantity * $item->price }}</p>
                        </td>
                            
                        
                    </tr>
                    @php
                       echo $content .= '名稱:' . $item->name . '。 <br>'  ;
                       echo $content .= '價格:' . $item->price . '。 <br>';
                       echo $content .= '數量:' . $item->quantity . '。 <br>';
                       echo $content .= '小記:' . $item->quantity * $item->price . '。 <br>';
                        
                    @endphp
                     <br>
                    <input type="hidden" name="item_id[]" value="{{ $item->id }}">
                    <input type="hidden" name="quantity[]" value="{{ $item->quantity }}">
                @endforeach
                @php
                    $content .= '總額:' . $total . '。';
                    // $content .= '<br>';
                    $content .= '點餐時間' . date('h:i:sa') . '。';
                @endphp
                <tr >
                    <td>總價{{ $total }}</td>
                </tr>
            </tbody>
        </table>
        @if (empty(session('used')))
            <button class="mt-5 btn btn-outline-dark"">確認訂單</button>
        @endif
    </form>
    <div class="col-6 mt-5">
        <form class="form-group" id="Order">
            <div class="title">Order</div>
            <input class="form-control" type="text" name="name" value="{{ $name }}"
                style="display:none" />
            <input class="form-control" type="text" name="email" value="{{ $email }}"
                style="display:none" />
            <textarea class="form-control" name="content" style="display:none" />{{ $content }}</textarea>
            <button class="btn btn-primary" style="font-size:20px">
                Send
                <i class="fa fa-spinner fa-spin"></i>
            </button>
        </form>
    <br>
        <div class="success">Thank you for your Order!</div>
    </div>
</div>

</body>

<script>
    $('.success').hide();
    $('.fa-spin').hide();
    $('#Order').submit(function(event) {
        event.preventDefault();
        $('.fa-spin').show();
        $.post('{{ url('/api/sendmail') }}', $("#Order").serialize(), function(data) {
            $('#Order').hide();
            $('.success').show();
        })
    })
</script>

</html>
