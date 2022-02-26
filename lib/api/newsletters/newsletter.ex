defmodule Api.Newsletters.Newsletter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "newsletters" do
    field :htmlContent, :string
    field :name, :string
    field :publish_date, :utc_datetime
    field :rawContent, :string

    timestamps()
  end

  @doc false
  def changeset(newsletter, attrs) do
    newsletter
    |> cast(attrs, [:rawContent, :htmlContent, :name, :publish_date])
    |> validate_required([:rawContent, :name, :publish_date])
  end
end
