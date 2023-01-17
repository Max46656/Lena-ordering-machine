<div class="col-12 text-center" style="margin: 30px 0 3px 0;">
  <a href="{{ route('addRes') }}"><button type="button" class="btn btn-primary">新增餐廳</button></a>
  <a href="{{ route('addMenu') }}"><button type="button" class="btn btn-warning">編輯菜單</button></a>
  <div class="hidden fixed top-0 right-0 sm:block">
    <form method="POST" action="{{ route('logout') }}">
      @csrf
      <a href="{{ route('logout') }}" class="text-sm text-gray-700 dark:text-gray-500 underline"
        onclick="event.preventDefault();this.closest('form').submit();">
        登出</a>
    </form>