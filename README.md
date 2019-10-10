# Sample of [TableStructure](https://github.com/jsmmr/ruby_table_structure) library

## Ruby on Rails

```sh
docker-compose build rails
docker-compose run --rm rails bundle install
docker-compose run --rm rails yarn install
docker-compose run --rm rails rails db:reset

docker-compose up rails
```

Streaming CSV download:
```sh
curl http://localhost:3000/users.csv
```

If you want to insert more sample records:
```sh
docker-compose run --rm rails rails db:seed
```
