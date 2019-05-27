<main class=" flex flex-1  flex-wrap justify-between -mx-2 px-2 py-4">
 
@foreach ($products as $product)
    <div class="flex flex-col card  mb-2 " style=" width:325px">
        <div class="flex-1 ">
            <div class="mx-auto text-center">
                 <img class="w-auto rounded-lg w-full" src={{ $product->featured_img }} style="height:325px" alt="Sunset in the mountains">
            </div>
        </div>
        <div class=" card mt-2 text-center">
            <h1 class="text-xl font-semibold p-2">{{ $product->title }}</h1>
        </div>
        <div>
            <p class="mt-4">{{ substr($product->description ,0,150) }}  
            <a class="text-blue-900 font-extrabold no-underline" href="{{ $url = action('ProductController@show', ['id' => $product->id]) }}" >... more <i class="fas fa-angle-double-right"></i></a></p>
        </div>
        <div class="flex flex-row justify-between">

            @include('dashboard.components._pricing')
                        
        </div>
     
    </div>
@endforeach


</main>