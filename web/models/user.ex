defmodule Ararea.User do
  use Ararea.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :name, :string
    field :avatar, :string
    field :website, :string
    field :bio, :string
    field :accent_color, :string, default: "#000"

    field :password, :string
    field :verification_token, :string

    field :twitter_username, :string
    field :youtube_username, :string
    field :twitch_username, :string
    field :steam_username, :string
    field :battletag, :string
    field :github_username, :string
     
    field :country, :string
    field :gender, :string
    field :is_gender_private, :boolean, default: false
    field :birth_year, :integer
    field :is_birth_year_private, :boolean, default: false
    field :languages, {:array, :string}, default: ["English"]

    # Arrays with ids
    field :favorite_subjects, {:array, :integer}, default: []
    field :favorite_games, {:array, :integer}, default: []
    field :current_games, {:array, :integer}, default: []

    timestamps
  end

  @social_fields ~w(twitter_username youtube_username twitch_username steam_username battletag github_username)
  @basic_fields ~w(username email password name accent_color)
  @additional_fields ~w(country gender is_gender_private is_birth_year_private avatar languages website bio)
  @status_fields ~w(favorite_games favorite_subjects current_games)

  @registration_required_fields @basic_fields
  @registration_optional_fields @social_fields ++ @additional_fields

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def registration_changeset(model, params \\ :empty) do
    model
    |> cast(params, @registration_required_fields, @registration_optional_fields)
    |> validate_length(:username, min: 3, max: 15)
    |> unique_constraint(:username, on: Ararea.Repo, downcase: true)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, on: Ararea.Repo, downcase: true)
    |> validate_length(:name, min: 2, max: 35)
    |> validate_length(:bio, max: 500)
  end
end
