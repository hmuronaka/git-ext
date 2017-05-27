gitのブランチ名がissue-noを表す場合、+0.1楽にするコマンド達

# require

- osx +
- ruby 2.2 +

# prepare

install [ruby-git](https://github.com/schacon/ruby-git)

```sh
gem install git
```

# git chk branch_name

ブランチをcheckoutする際、branch名を後方探索する。
ローカルにブランチがある場合は、それに切り替える。
リモートにしかない場合は、そのブランチを作成する。

```sh
> git chk 123 # もしissue-123というブランチが存在する場合、
              # issue-123に切り替える。
```

# git issue

現在のブランチのissueを定義しているページをブラウザで表示する。

( ブラウザ表示にopenを利用している為、現状ではmac限定)

```sh
git checkout issue-123
git issue # https://issue.com/issues/123 などを表示する
```

設定ファイル.
gitリポジトリのあるディレクトリにgit_extファイルを定義する必要がある。

```ruby
# git_ext


# ブランチ名からチケットIDを取得する
issue_pattern /issue-([\d]+)/ do
  $1
end

issue_url do |issue|
  "https://issue.com/issues/#{issue}"
end
```

