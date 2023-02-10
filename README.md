# Lena-ordering-machine

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
莉娜點餐機的目的是展示餐廳與餐點，將使用者的訂單紀錄並執行處理。

## Description

莉娜點餐機實作了動態展示網頁畫面、前端即時更改網頁內容、後端的CRUD與界面、購物車邏輯、自動填寫email內容。

## Installation

### Requirement

Laravel 9.47.0、Node v18.12.1、npm 8.19.2、Composer 2.4.4、PHP 8.1.2、mysql 15.1,MariaDB 10.4.22;
確保你的環境版本正確或更新。

### .env Setting

APP_URL、APP_KEY、DB_USERNAME、DB_PASSWORD、MAIL_USERNAME、MAIL_PASSWORD，
需要填寫為依據你環境設置的內容。

### Build Setup

在將專案Clone到你的本地端後使用終端機依序執行以下指令。

```shell
composer install
npm install
npm run dev
cp .env.example .env
php artisan key:generate
```

注意專案小組位於時區+08:00，專案與.sql均設定為此時區。
在MySQL中匯入"資料庫匯入\Lena-ordering-machine.sql"，
將.env中的database設定為"Lena-ordering-machine"後，使用終端機依序執行以下指令。

```shell
php artisan storage:link
php artisan voyager:admin yourAdminAccount@email.com --create
```

或使用已建立的管理員帳號以作為測試用途admin@admin.com密碼123456，測試用的一般帳號為user@user.com密碼12345678。
僅當你在更改資料庫結構後才需要使用終端機依序執行以下指令，
但需要注意這會重製Voyager的管理系統，其結構與內容的備份位於"資料庫匯入\Voyager.sql"

```shell
php artisan migrate:reset
php artisan db:seed
php artisan db:seed --class=VoyagerDatabaseSeeder
```

此外當你在開發時想測試Livewire的執行結果也需要此指令。

```shell
php artisan serve
```

## Usage

### for Admin

- 本專案使用Voyager管理後端CRUD，你能在"url('/admin')"中查看並管理網站的使用者、訂單、餐廳、菜單。
- 使用Voyager建立的帳號與JetStream建立的帳號權限不同，
僅有Voyager管理員才能直接從首頁進入新增餐廳與菜色。JetStream則是本專案的一般使用者系統，
未登入者進入此網站時會被導向JetStream的註冊頁面，並從該頁面導向登入頁面。
- 當你需要新增Voyager的管理員帳號時，必須使用上述建立admin@admin.com的方式。

### for User

- 當天的第一個使用者能夠自由選擇任意餐廳，其點完餐後在session中會儲存今日餐廳，
之後的使用者會被限定在該餐廳中點餐。每個使用者在確定他們的訂單後個人訂單會被送入時間段內的所有訂單列表，
讓使用者能參考其他人的訂單，並將訂單透過Email送出到值日生手中。

- 使用者能給予餐廳評價或將餐廳新增到"我的最愛"，使用者們的綜合評價會影響餐廳的排序，
而新餐廳會排在所有餐廳前。使用者也能僅檢視"我的最愛"的口袋餐廳或使用搜尋功能（現僅限使用餐廳名稱，不支援標籤搜尋）。

## Contributing

- 此專案的指導教授為[哥布林](https://github.com/javck)。
- 此Demo中使用圖片來自[亜樹](https://www.pixiv.net/users/85082857)、[もみじ真魚](https://www.pixiv.net/users/7592/artworks)、[xinxindi](https://www.pixiv.net/users/62642122)等繪師，
以上圖片均不作為且不可為商用，僅作為演示專案功能的用途。
- 本專案由數位人員花了約70小時完成的作品，也是我們第一個完成的Laravel專案，
感謝過程中的Stack Overflow文章與laravel官方文件。

## Warning

- 本專案均使用[Tailwind](https://tailwindcss.com)進行排版；使用[darryldecode/cart](https://github.com/darryldecode/laravelshoppingcart)作為購物車；使用[livewire](https://laravel-livewire.com)撰寫前端即時回應；
使用[jetStream](https://jetstream.laravel.com/2.x/introduction.html)作為一般使用者系統；使用tcg/voyager作為資料庫管理員系統。
- 在"darryldecode/cart 4.2"，此版本存在錯誤，已使用"overrideVender"與"composer.json"進行覆寫。
- 有關寄信系統，本專案不使用Mailables而是使用jquery整理格式並使用MailController寄出信件。
寄信系統的設定中使用google smtp，你需要申請應用程式密碼並填入.env中。
- 由於僅作為演示，目前值日生的隨機抽取與紀錄值日生的code為註釋狀態，僅能寄出到專案作者的信箱中。
- 除此之外的功能與其實作方式簡述紀錄在"功能清單.ods"中。
