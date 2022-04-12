defmodule Api.Newsletters.Newsletter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "newsletters" do
    field :htmlContent, :string
    field :name, :string
    field :campaignName, :string
    field :publish_date, :utc_datetime
    field :published_date, :utc_datetime
    field :is_published, :boolean, default: false
    field :rawContent, :string

    timestamps()
  end

  @doc false
  def changeset(newsletter, attrs) do
    newsletter
    |> cast(attrs, [:rawContent, :htmlContent, :name, :publish_date, :campaignName])
    |> validate_required([:rawContent, :htmlContent, :name, :publish_date, :campaignName])
  end

  def changeset_publish_newsletter(newsletter, attrs) do
    newsletter
    |> cast(attrs, [:id, :published_date, :is_published])
    |> validate_required([:id, :published_date, :is_published])
  end
end
