<div>
    {{-- The whole world belongs to you. --}}

    <div style="text-align: center">
        <button type="button" wire:click="increment">+</button>
        <input type="number"  name="quantity[]" id="" value="{{ $count }}">
        <button type="button" wire:click="decrement">-</button>
    </div>
</div>
