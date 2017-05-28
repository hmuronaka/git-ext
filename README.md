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

「現在のブランチまたは指定したidのissue」を定義しているページをブラウザで表示する。

( ブラウザ表示にopenを利用している為、現状ではmac限定)

```sh
git checkout issue-123
git issue # https://issue.com/issues/123 を表示する
git issue 124 # https://issue.com/issues/124を表示する
```

# git pullreq

「現在のブランチ」のpullreqページをブラウザで表示する。

```sh
git checkout issue-123
git pullreq # https://issue.com/pullreq/...123を表示する
```

# 設定ファイル.
gitリポジトリのあるディレクトリにgit_extファイルを定義する。

```ruby
# git_ext


# ブランチ名からチケットIDを取得する
issue_pattern /issue-([\d]+)/ do |m| # mはRegexp.last_match
  m[1] # $1と同じ。
end

issue_url do |issue|
  "https://issue.com/issues/#{issue}"
end

pullreq_url do |branch|
  "https://issue.com/pullreq/#{branch}"
end
```

