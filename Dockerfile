FROM mexx/ruby-chromedriver:latest
MAINTAINER Stanislav Mekhonoshin <opensource@howtohireme.ru>

WORKDIR /app
COPY ./ .

RUN bundle install
