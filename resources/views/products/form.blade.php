@csrf

@include ('errors')

<div class="field mb-6">
  <label class="block">
    <span class="text-gray-700 font-bold">Display Name</span>
    <input type="text" class="form-input mt-1 block w-full" name='title' placeholder="Enter the name of the piece." value="{{old('title', $product->title)}}">
  </label>
</div>

<input name="slug" type="hidden" >

<div class="field mb-6">
  <label class="block">
    <span class="text-gray-700 font-bold">Description</span>
    <textarea class="form-textarea mt-1 block w-full" name='description' rows="5" placeholder="Please enter the description of the piece.">{{old('description', $product->description) }}
    </textarea>
  </label>
</div>

<div class='flex flex-row justify-around space-x-2'>
    <div class="field mb-6 w-1/2">
      <label class="block">
        <span class="text-gray-700 font-bold">Medium</span>
        <input type="text" class="form-input mt-1 block w-full" name='medium'  value="{{old('medium', $product->medium)}}">
      </label>
    </div>

  <div class="field mb-6 w-1/2">
      <label class="block">
        <span class="text-gray-700 font-bold">Size</span>
        <input type="text" class="form-input mt-1 block w-full" name='size' value="{{old('size', $product->size)}}">
      </label>
    </div>
</div>


<div class="field mb-6">
  <div class="block">
    <span class="text-gray-700 font-bold">Status</span>
    <div class="mt-2 flex">
      <div>
        <label class="inline-flex items-center mr-4">
          <input type="radio" class="form-radio text-indigo-600" name="status" @if(old('status',$product->status)=="For Sale") checked @endif
          value = 'For Sale'/>
          <span class="ml-2">For Sale</span>
        </label>
      </div>
      <div>
        <label class="inline-flex items-center mr-4">
          <input type="radio" class="form-radio text-pink-600" name="status" @if(old('status',$product->status)=="Not For Sale") checked @endif
          value = 'Not For Sale'/>
          <span class="ml-2">Not for Sale</span>
        </label>
      </div>
      <div>
        <label class="inline-flex items-center mr-4">
          <input type="radio" class="form-radio text-pink-600" name="status" @if(old('status',$product->status)=="Sold") checked @endif
          value = 'Sold'/>
          <span class="ml-2">Sold</span>
        </label>
      </div>
    </div>
  </div>
</div>

<div class="field mb-6">
  <label class="block">
    <span class="text-gray-700 font-bold">Price (in Cents)</span>
    <input type="text" class="form-input mt-1 block w-1/2" name='price'  placeholder="Price of the piece, in cents." value={{old('price', $product->price)}}>
  </label>
</div>
{{--
      <div class="block mb-4">
        <span class="text-gray-700 font-bold">Existing Categories</span>
        <div class="mt-2">
          <div class="flex flex-wrap ">
            @foreach($product->categories as $existing)
              <div class="mx-4 font-semibold">
                {{ $existing->category }}
      </div>
      @endforeach
      </div>
      </div>
      </div>
--}}


<div class="block mb-4">
  <span class="text-gray-700 font-bold">Categories</span>
  <div class="mt-2">
    <div class="flex flex-wrap ">
      @foreach($categories as $category)
      <label class="mx-2 inline-flex items-center">
        <input class="form-checkbox text-indigo-600" type="checkbox" name='categories[]' value='{{$category->id}}'
        {{in_array($category->id,$assignedCats)?'checked':''}} />
        <span class="ml-2">{{ $category->category }},</span>
      </label>
      @endforeach
    </div>
  </div>
</div>



<div class="field mb-6">
  <label class="block">
    <span class="text-gray-700 font-bold">Published </span>
    @if($product->publish_at != null)
    <input type="date" name="publish_at" value="{{  $product->publish_at->format('Y-m-d')  }}"  class="form-input mt-1 block w-full">
    @else
    <input type="date" name="publish_at"  class="form-input mt-1 block w-full">
    @endif
  </label>
</div>

<input type=hidden name='discount' value=0 />
<div class="field">
  <div class="control">
    <button type="submit" class="btn btn-blue is-link mr-2">{{ $buttonText }}</button>

    <a href="{{ $product->path() }}" class="text-default">Cancel</a>
  </div>
</div>
