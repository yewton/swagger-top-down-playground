[![Circle CI](https://circleci.com/gh/yewton/swagger-top-down-playground/tree/master.svg?style=svg)](https://circleci.com/gh/yewton/swagger-top-down-playground/tree/master)

Swagger top-down playground
===========================

トップダウン(API仕様を書くことから始める)で Swagger を利用する場合の運用例です。

デモ
----

- [mockサーバ](https://yewton-swagger-playground.herokuapp.com/docs/)
    - [swagger-codegen](https://github.com/swagger-api/swagger-codegen)を利用して生成したもの( `-l nodejs` )
    - Heroku のフリーインスタンスなので落ちていることがあるかも…
- [静的なドキュメント](http://yewton.github.io/swagger-top-down-playground/)
    - [bootprint-swagger](https://github.com/nknapp/bootprint-swagger)を利用して生成したもの

遊び方
------

### 必要なもの
- Docker
- gulp

### 準備

```
cd api-doc
npm install
```

### プレビューアを起動する

```
gulp --env staging run-editor
```

### 編集を開始する

```
gulp serve --env production --editorHost $(docker-machine ip default)
```

### プレビューアを終了する

```
gulp --env staging stop-editor
```
