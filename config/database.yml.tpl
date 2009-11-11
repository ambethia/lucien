# SQLite version 3.x
#   gem install sqlite3-ruby (not necessary on OS X Leopard)
development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test: &TEST
  adapter: sqlite3
  database: db/test.sqlite3
  pool: 5
  timeout: 5000

cucumber:
  <<: *TEST

production:
  adapter: sqlite3
  database: db/production.sqlite3
  pool: 5
  timeout: 5000

