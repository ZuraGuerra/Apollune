defmodule Ararea.Repo.Migrations.IndexUserFields do
  use Ecto.Migration

  def up do
    execute "CREATE INDEX users_name_index ON users USING gin(to_tsvector('english',name));"
    execute "CREATE INDEX bio_index ON users USING gin(to_tsvector('english',bio));"
    execute "CREATE INDEX username_index ON users USING gin(to_tsvector('english',username));"
  end

  def down do
    execute "DROP INDEX bio_index;"
    execute "DROP INDEX users_name_index;"
    execute "DROP INDEX username_index;"
  end
end
