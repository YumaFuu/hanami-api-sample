FROM ruby:2.7.1

ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN echo 'gem: --no-document' > ~/.gemrc \
 && gem install bundler \
 && bundle install

ENV APP_HOME /app

WORKDIR $APP_HOME
ADD . $APP_HOME
EXPOSE 2300
CMD ["bundle", "exec", "rackup", "-p", "2300", "-o", "0.0.0.0"]
