defmodule Api.Repo.Migrations.CreateNewsletters do
  use Ecto.Migration

  def change do
    create table(:newsletters) do
      add :rawContent, :text
      add :htmlContent, :text
      add :name, :string
      add :publish_date, :utc_datetime
      add :published_date, :utc_datetime
      add :is_published, :boolean, default: false, null: false
      timestamps()
    end
  end
end
