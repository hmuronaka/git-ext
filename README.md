gitのブランチ名がissue-noを表す場合、+0.1楽にするコマンド達

# require

- ruby 2.2+

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
