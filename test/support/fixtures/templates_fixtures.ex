defmodule Api.TemplatesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Templates` context.
  """

  @doc """
  Generate a template.
  """
  def template_fixture(attrs \\ %{}) do
    {:ok, template} =
      attrs
      |> Enum.into(%{
        content: "some content",
        name: "some name"
      })
      |> Api.Templates.create_template()

    template
  end
end
