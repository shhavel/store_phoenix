defmodule Store.Repo.Migrations.AddSearchIndexes do
  use Ecto.Migration

  def up do
    execute "CREATE extension if not exists pg_trgm;"

    execute "CREATE INDEX books_name_trgm_index ON books USING gin (name gin_trgm_ops);"
    execute "CREATE INDEX books_genres_trgm_index ON books USING gin (genres gin_trgm_ops);"
    execute "CREATE INDEX books_authors_trgm_index ON books USING gin (authors gin_trgm_ops);"
    execute "CREATE INDEX books_publisher_trgm_index ON books USING gin (publisher gin_trgm_ops);"

    execute "CREATE INDEX articles_name_trgm_index ON articles USING gin (name gin_trgm_ops);"
    execute "CREATE INDEX articles_genres_trgm_index ON articles USING gin (genres gin_trgm_ops);"
    execute "CREATE INDEX articles_authors_trgm_index ON articles USING gin (authors gin_trgm_ops);"
  end

  def down do
    execute "DROP INDEX books_name_trgm_index;"
    execute "DROP INDEX books_genres_trgm_index;"
    execute "DROP INDEX books_authors_trgm_index;"
    execute "DROP INDEX books_publisher_trgm_index;"

    execute "DROP INDEX articles_name_trgm_index;"
    execute "DROP INDEX articles_genres_trgm_index;"
    execute "DROP INDEX articles_authors_trgm_index;"
    execute "DROP INDEX articles_publisher_trgm_index;"
  end
end
