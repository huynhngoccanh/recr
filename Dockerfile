FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs apt-transport-https apt-utils
RUN apt-get install -y graphviz

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for a JS runtime
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# for yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn

ENV DIR /var/www
RUN mkdir $DIR
WORKDIR $DIR
ADD . $DIR
RUN cp docker/config/database.yml $DIR/config

ENV BUNDLE_GEMFILE=$DIR/Gemfile \
BUNDLE_JOBS=2 \
BUNDLE_PATH=/bundle

RUN gem install bundler
