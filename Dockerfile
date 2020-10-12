FROM ruby:2.7.1

LABEL author.name = "SaoBV" \
      author.email = "bui.van.sao@sun-asterisk.com"

ENV APP_PATH /app
WORKDIR $APP_PATH

RUN apt-get update \
    && apt-get install -y nodejs nano
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
    && apt-get install yarn -y

ADD Gemfile $APP_PATH
ADD Gemfile.lock $APP_PATH

ADD . $APP_PATH

COPY docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
