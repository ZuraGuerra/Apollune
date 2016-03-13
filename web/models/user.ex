defmodule Ararea.User do
  use Ararea.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :name, :string
    field :avatar, :string
    field :website, :string
    field :bio, :string
    field :accent_color, :string

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
    field :languages, {:array, :string}, default: []

    # Arrays with ids
    field :favorite_subjects, {:array, :integer}, default: []
    field :favorite_games, {:array, :integer}, default: []
    field :current_games, {:array, :integer}, default: []

    timestamps
  end

  @required_fields ~w(username email password name avatar website bio twitter_username youtube_username twitch_username steam_username battletag accent_color github_username verification_token country gender is_gender_private birth_year is_birth_year_private)
  @optional_fields ~w(favorite_subjects favorite_games current_games languages)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
