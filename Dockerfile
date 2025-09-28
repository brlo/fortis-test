FROM ruby:3.4.6

RUN apt-get update -qq && apt-get install -y \
    nano \
    postgresql-client \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

WORKDIR /app

EXPOSE 3000

ENTRYPOINT ["/app/docker-entrypoint.sh"]
