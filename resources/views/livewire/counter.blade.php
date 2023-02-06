<div>
  <div Class="
text-center">
    <button type="button"class="btn py-3 px-6 mx-3  bg-red-300 hover:bg-red-400 active:bg-red-600 rounded-lg" wire:click="increment">+</button>
    <input type="number" name="quantity[]" id="" value="{{ $count }}" min="0">
    <button type="button" class="btn py-3 px-6 mx-3 bg-yellow-200 hover:bg-yellow-300 active:bg-yellow-600 rounded-lg" wire:click="decrement">-</button>
  </div>
</div>