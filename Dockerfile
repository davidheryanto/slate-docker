FROM ruby:2.4-slim-stretch

LABEL maintainer="david.heryanto@hotmail.com"

COPY build-static-doc /usr/bin/

RUN chmod 755 /usr/bin/build-static-doc \
	&& apt-get -qq update && apt-get -qq -y install make gcc g++ git nodejs wget \
    && wget -qO- https://github.com/lord/slate/archive/v2.0.0.tar.gz | tar xzf - \
    && mv slate-2.0.0 slate && cd slate \
    && echo 'gem "middleman-livereload", "~> 3.4.3"' >> Gemfile \
    && echo 'activate :livereload' >> config.rb \
    && bundle install

WORKDIR /slate

EXPOSE 4567

ENTRYPOINT ["build-static-doc"]
