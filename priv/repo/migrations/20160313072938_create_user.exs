defmodule Ararea.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :text
      add :email, :string
      add :password, :string
      add :name, :text
      add :avatar, :string
      add :website, :string
      add :bio, :text
      add :twitter_username, :string
      add :youtube_username, :string
      add :twitch_username, :string
      add :steam_username, :string
      add :battletag, :string
      add :accent_color, :string
      add :github_username, :string
      add :verification_token, :string
      add :country, :string
      add :gender, :string
      add :is_gender_private, :boolean, default: false
      add :birth_year, :integer
      add :is_birth_year_private, :boolean, default: false
      add :languages, {:array, :string}
      add :current_games, {:array, :integer}
      add :favorite_games, {:array, :integer}
      add :favorite_subjects, {:array, :integer}

      timestamps
    end

  end
end
