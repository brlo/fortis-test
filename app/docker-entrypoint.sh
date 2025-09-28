#!/bin/bash
set -e

# Удаляем возможно существующий pid-файл для запуска Rails-сервера
rm -f tmp/pids/server.pid

# rails assets:clobber
# rails assets:precompile
bundle install
yarn install
yarn build:css

# так как это демонстрационный стенд, то каждый запуск готовим
# базу и заново наполняем тестовыми данными
bundle exec rails db:prepare
bundle exec rails db:migrate
bundle exec rails db:seed

# Передаём управление основному процессу
exec "$@"
