<meta property="og:site_name" content="Borneo Artis.">
<meta property="og:title" content="Borneo Artist : {{$product->title}}">
<meta property="og:description" content="{!! nl2br($product->description) !!}">
<meta property="og:image" content="{{URL::asset( $product->featured_img)}}">
<meta property="og:url" content="{{ url()->current()}}">
<meta name="twitter:card" content="summary_large_image">
<title>Hellen Dutch Art :{{$product->title}}</title>