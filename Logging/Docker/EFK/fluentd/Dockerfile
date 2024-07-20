FROM fluent/fluentd:v1.14-1

# Use root account to use apk
USER root

# Install plugins
RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && gem install faraday-net_http -v 3.0.2 \
 && gem install faraday -v 2.8.1 \
 && sudo gem install fluent-plugin-elasticsearch \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

# Switch back to fluent user
USER fluent