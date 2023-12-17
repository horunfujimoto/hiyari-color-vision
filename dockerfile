# ベースイメージの指定
FROM ruby:3.1.2

RUN apt-get update

# nginxインストール
RUN apt-get -y install nginx

# vimインストール（必須ではない）
RUN apt-get -y install vim

# nodejsインストール
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs

# yarnインストール
RUN npm install --global yarn

# ワークスペース移動(cd コマンドと同じ)
WORKDIR /app

# ソースコードをコピー
COPY ../ ./

# プロダクションに必要な環境変数
ENV RAILS_ENV=production
ENV SECRET_KEY_BASE=e87f1fdc3ad92e4dc0f97dad39c53712e153a63c8e25f13248ac30b3a43dcf328d57f075ef96a6b234dce66259cfc44ce28b85b4b7bc0d2602083dd94473d72b

# bundle install
RUN bundle install --path vendor/bundle --without test development

# アセットをプリコンパイル
RUN bundle exec rails assets:precompile RAILS_ENV=production; exit 0
RUN bin/webpack

# nginx設定ファイルをコピー
COPY nginx.conf /etc/nginx/nginx.conf
COPY rails.conf /etc/nginx/conf.d/rails.conf

# 外部DB接続の為、ここで実施しない
# データベースのマイグレーションなど
# RUN bundle exec rails db:create db:migrate db:seed RAILS_ENV=production

# railsとnginxの起動、nginxはデーモンOFF
CMD bundle exec rails server && /usr/sbin/nginx -g "daemon off;"
# CMD sleep infinity
