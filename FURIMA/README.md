
# README

WSL2で以下のエラーが表示された場合は、コマンドを実行する。
```
Could not verify the SSL certificate for https://rubygems.org/.
```

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y ca-certificates
sudo update-ca-certificates
```

mysql2関連のエラーは以下のコマンドを実行
```bash
sudo apt install default-libmysqlclient-dev default-mysql-server default-mysql-client
```

その後もSSLエラーが発生するが、不安定？なため表示される

Gemfileのrubyとrailsのバージョンを変更して、コマンドを実行することでアップデートする。
```bash
bundle update
rails app:update
```
→ 全てyにして、必要な差分を戻してからサーバーを起動する。

imagemagickもインストールが必要
```
sudo apt install imagemagick
```
