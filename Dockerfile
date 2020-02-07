FROM lastobelus/ruby-node-yarn:latest

COPY Gemfile* /tmp/
COPY package.json /tmp/
COPY yarn.lock /tmp/
WORKDIR /tmp
RUN yarn install
RUN bundle install --jobs 5 --retry 5 --without development test

RUN mkdir /app
WORKDIR /app
COPY . /app
ENV RAILS_ENV production
ENV RACK_ENV production
CMD ["bin/run-dev.sh"]