# ColorMe
[![Build Status](https://travis-ci.org/s-osa/color_me.png?branch=master)](https://travis-ci.org/s-osa/color_me)
[![Code Climate](https://codeclimate.com/github/s-osa/color_me.png)](https://codeclimate.com/github/s-osa/color_me)

カラーミーのAPI（ http://shop-pro.jp/?mode=api_started ）をRubyから扱うためのラッパーgem

### 対応Rubyバージョン

- 1.9.3
- 2.0.0
- 2.1.0


## インストール

Gemfileに以下の内容の追加して`bundle`コマンドを実行してください。

    gem 'color_me', github: 's-osa/color_me'

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/s-osa/color_me/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## テスト

基本的なテストは以下のコマンドで実行できます。

```sh
$ bundle exec rake spec
```

また、実際のAPIを用いたテストが以下のコマンドで行えます。

```sh
$ echo "YourOwnToken" > token
$ bundle exec rake spec:online
```

`token `ファイルは`.gitignore`に含まれていますが、typoなどによるcommitに注意してください。
