<div>
  <div style="text-align: center">
    <button type="button" wire:click="increment">+</button>
    <input type="number" name="quantity[]" id="" value="{{ $count }}" min="0">
    <button type="button" wire:click="decrement">-</button>
  </div>
</div>