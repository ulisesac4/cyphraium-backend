defmodule Api.NewslettersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Newsletters` context.
  """

  @doc """
  Generate a newsletter.
  """
  def newsletter_fixture(attrs \\ %{}) do
    {:ok, newsletter} =
      attrs
      |> Enum.into(%{
        htmlContent: "some htmlContent",
        name: "some name",
        publish_date: ~U[2022-02-25 22:02:00Z],
        rawContent: "some rawContent"
      })
      |> Api.Newsletters.create_newsletter()

    newsletter
  end
end
