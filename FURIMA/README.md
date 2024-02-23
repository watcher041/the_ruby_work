
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

railsにReactを導入する場合
```Gemfile
gem 'jsbundling-rails'
```
```bash
bundle
yarn add react react-dom esbuild
```
```bin/dev
#!/usr/bin/env sh

if gem list --no-installed --exact --silent foreman; then
  echo "Installing foreman..."
  gem install foreman
fi

# Default to port 3000 if not specified
export PORT="${PORT:-3000}"

exec foreman start -f Procfile.dev "$@"
```
```Procfile.dev
web: env RUBY_DEBUG_OPEN=true bin/rails server
js: yarn build --watch
```
```package.json
"dependencies": {
    "esbuild": "^0.20.1",
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
},
    "scripts": {
    "build": "esbuild app/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds --public-path=assets",
    "build:css": "tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css --minify"
}
```
```bash
sudo chmod +x bin/dev
bin/dev
```