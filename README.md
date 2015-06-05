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

# 参照

+ [k2works/rails4-auth-controll](https://github.com/k2works/rails4-auth-controll)
+ [k2works / railscrudtabformsample_web](https://registry.hub.docker.com/u/k2works/railscrudtabformsample_web/)
