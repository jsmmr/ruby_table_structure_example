# [TableStructure](https://github.com/jsmmr/ruby_table_structure) sample

[![CircleCI](https://circleci.com/gh/jsmmr/ruby_table_structure_sample/tree/master.svg?style=svg)](https://circleci.com/gh/jsmmr/ruby_table_structure_sample/tree/master)

## Ruby on Rails

```sh
docker-compose build rails
docker-compose run --rm rails bundle install
docker-compose run --rm rails yarn install
docker-compose run --rm rails rails db:reset

docker-compose up rails
```

HTML page:
```sh
[http://localhost:3000/users](http://localhost:3000/users)
```

Streaming CSV download:
```sh
[http://localhost:3000/users.csv](http://localhost:3000/users.csv)
```

If you want to insert more sample records:
```sh
docker-compose run --rm rails rails db:seed
```
