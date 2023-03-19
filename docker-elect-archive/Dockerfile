
# Linuxカーネルにrubyイメージを導入
FROM ruby:3.1.2

# dockerはlinuxカーネルを軸に動作するので、環境構築に必要なパッケージはapt-getでインストール
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev nodejs

# kakasi（ローマ字に変換するツール）をインストール
RUN wget http://kakasi.namazu.org/stable/kakasi-2.3.6.tar.gz && \
    tar zxvf kakasi-2.3.6.tar.gz && \
    cd kakasi-2.3.6 && \
    ./configure && \
    make && \
    make install && \
    echo "/usr/local/lib" >> /etc/ld.so.conf.d/usrlocal.conf && \
    ldconfig

# ipv6を無効化してbundle installがエラーにならないようにする
# RUN echo -e "\n\
#     net.ipv6.conf.all.disable_ipv6 = 1\n \
#     net.ipv6.conf.default.disable_ipv6 = 1\n \
#     " >> /etc/sysctl.conf

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD [ "rails", "server" ,"-b", "0.0.0.0" ]