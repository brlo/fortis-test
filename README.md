# SETUP

To start

```shell
docker compose build
docker compose up
```

To stop

```shell
docker compose down
```

# NOTICE

В этой связке Ruby<->RoR есть ряд проблем с logger и некоторыми библиотеками. Поэтому прежде создания приложения необходимо проинициализировать logger и установить некоторые гемы.

Для инициализации нового приложения понадобилось создать template.rb:

```ruby
gem 'bigdecimal'
gem 'mutex_m'
gem 'benchmark'
```

Затем выполнить команду:

```shell
RUBYOPT="-r logger" rails new app -m template.rb --database=postgresql --css=bootstrap --skip-test
```
