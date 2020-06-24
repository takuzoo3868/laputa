# laputa

<p align="center">
<img width=60% src="https://i.imgur.com/HNFaDf0.png"></p>

## なんぞこれ

`laputa` は `vuls` の機能をお試しで検証するDocker環境です．  
様々なOSをセットアップします．

## Lite Latobarita Ulsu, Aliaros Bal Netoriil.

以下の作業は `laputa` ディレクトリ内を想定しています．

### ssh 鍵の生成（初回のみ）

```bash
ssh-keygen -t ecdsa -N '' -f keys/id_ecdsa
cat keys/id_ecdsa.pub >>keys/authorized_keys
ln keys/authorized_keys data/
```

### コンテナの起動

```bash
sudo docker-compose up -d --build
```

## ssh セットアップ

```bash
ssh vuls@127.0.0.1 -p 2222 -i keys/id_ecdsa cat /etc/os-release
ssh vuls@127.0.0.1 -p 2223 -i keys/id_ecdsa cat /etc/os-release
ssh vuls@127.0.0.1 -p 2224 -i keys/id_ecdsa cat /etc/os-release
```

### ログディレクトリ作成（初回のみ）

```bash
sudo mkdir -p /var/log/vuls
sudo chown "$(id -u):$(id -g)" /var/log/vuls
```

### DB セットアップ

`db/`に配置することを想定しています．  
詳しいCVEやOVALの取得は https://vuls.io/docs/en/install-manually.html を見てね．

CVEデータベース
```bash
go-cve-dictionary fetchnvd -last2y -dbpath $(pwd)/db/cve.sqlite3
go-cve-dictionary fetchjvn -last2y -dbpath $(pwd)/db/cve.sqlite3
```

OVALデータベース
```bash
goval-dictionary fetch-redhat -dbpath $(pwd)/db/oval.sqlite3 7
goval-dictionary fetch-debian -dbpath $(pwd)/db/oval.sqlite3 9
goval-dictionary fetch-ubuntu -dbpath $(pwd)/db/oval.sqlite3 18
```

GOSTデータベース
```bash
gost fetch debian --dbpath $(pwd)/db/gost.sqlite3
gost fetch redhat --dbpath $(pwd)/db/gost.sqlite3
```

POCデータベース
```bash
go-exploitdb fetch exploitdb --dbpath $(pwd)/db/go-exploitdb.sqlite3
go-msfdb fetch msfdb --dbpath $(pwd)/db/go-msfdb.sqlite3
```

### 設定ファイルの生成 (初回のみ)

`config_sample.toml` から `config.toml` を生成します

```bash
touch config.toml && cat config_sample.toml >> config.toml
```

`config.toml` 内の `SQLite3Path` の設定を絶対パスで指定します  
`echo $(pwd)/db/xxx.sqlite3` で確認が可能です

### Vuls の設定をテスト

```bash
vuls configtest
```

### 脆弱性スキャン

```bash
vuls scan
```

### 脆弱性レポートの作成

```bash
vuls report -format-json
```

### 脆弱性レポートの確認

お好みでどうぞ

```bash
vuls report
```

```bash
vuls tui
```

## 参考

- [ikasat/vuls-try-it-out](https://github.com/ikasat/vuls-try-it-out)