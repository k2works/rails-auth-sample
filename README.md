Rails 認証アプリケーションサンプル
===
# 目的
Rails認証アプリケーションサンプル

# 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| rails    　　　| 4.2.1        |             |
| ruby     　　　| 2.2.2        |             |
| docker   　　　| 1.6.0        |             |
| boot2docker 　|  1.6.0        |             |
| docker-compose　　| 1.1.0        |             |

# 構成
+ [セットアップ](#1)
+ [ユーザーストーリー](#2)
+ [開発](#3)

# 詳細
## <a name="1">セットアップ</a>

    $ docker-compose build
    $ docker-compose up -d

もしくは

    $ docker pull k2works/railsauthsample_web:WIP
    $ docker run -d -p 3000:3000 k2works/railsauthsample_web:WIP rails s -b 0.0.0.0

からの

http://コンテナのIPアドレス:3000/sample

コンテナIPはboot2dockerを使っているなら`boot2docker ip`で確認できる。

## <a name="2">ユーザーストーリー</a>

### AさんがBさんにメッセージを送る

+ Aさんがログインする
+ AさんがBさんにメッセージ送信
+ Bさんがログイン
+ ダッシュボートにAさんからメッセージが表示されている

### ログインする

+ 利用ユーザとして
+ システムにログインしたい
+ なぜなら複数のユーザで運用するから

#### 前提

+ ユーザが登録済み

#### 備考

### ダッシュボートを表示する

+ 利用ユーザとして
+ ダッシュボートで情報を一覧表示したい
+ なぜならば自分に関係する情報を確認したいから

#### 前提

+ ユーザが登録済み

#### 備考

### メッセージを送信する

+ 利用ユーザとして
+ 他の利用ユーザにメッセージを送信したい
+ なぜならば他のユーザに連絡をする必要があるから

#### 前提

+ ユーザが登録済み

#### 備考

+ 他のログインユーザの送信履歴は表示されないようにする

## <a name="3">開発</a>

### deviseインストール

```
$ rails generate devise:install
```

### devise用モデルインストール

```
$ rails generate devise User
```

### deviseのメーラーオプション設定

_config/environments/development.rb_
```
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

### マイグレーションの実行

```
$ rake db:migrate
```

### ログイン画面の確認

`rails s`実行後にブラウザで_http://localhost:3000/users/sign_in_にアクセスしてログイン画面を確認する

### deviseモデルのカスタマイズ

```
$ rails generate migration AddUsernameToUsers username:string
$ rake db:migrate
```

### ストロングパラメータ対応

_app/controllers/application_controller.rb_
```ruby
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
```

### deviseビューのカスタマイズ

```
$ rails generate devise:views users
```

### deviseコントローラーのカスタマイズ

```
$ rails generate devise:controllers users
```
_config/routes.rb_

```ruby
devise_for :users, controllers: { sessions: "users/sessions" }
```

カスタマイズしたビューが適用されているか確認する

```
$ rake routes
                  Prefix Verb   URI Pattern                    Controller#Action
        new_user_session GET    /users/sign_in(.:format)       users/sessions#new
            user_session POST   /users/sign_in(.:format)       users/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)      users/sessions#destroy
           user_password POST   /users/password(.:format)      devise/passwords#create
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
                         PATCH  /users/password(.:format)      devise/passwords#update
                         PUT    /users/password(.:format)      devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
       user_registration POST   /users(.:format)               devise/registrations#create
   new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
                         PATCH  /users(.:format)               devise/registrations#update
                         PUT    /users(.:format)               devise/registrations#update
                         DELETE /users(.:format)               devise/registrations#destroy
```


# 参照

+ [k2works/rails4-auth-controll](https://github.com/k2works/rails4-auth-controll)
+ [k2works / railscrudtabformsample_web](https://registry.hub.docker.com/u/k2works/railscrudtabformsample_web/)
