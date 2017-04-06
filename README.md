# Store [![Build Status](https://travis-ci.org/shhavel/store_phoenix.svg?branch=master)](https://travis-ci.org/shhavel/store_phoenix)

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Restoring database

    mix ecto.create
    pg_restore --verbose --clean --no-acl --no-owner -U postgres -d store_dev priv/repo/store.pgdb
    psql -U postgres -d store_dev -c "DROP TABLE schema_migrations"

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
