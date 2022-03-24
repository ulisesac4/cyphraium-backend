defmodule Api.SchedulersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Schedulers` context.
  """

  @doc """
  Generate a scheduler.
  """
  def scheduler_fixture(attrs \\ %{}) do
    {:ok, scheduler} =
      attrs
      |> Enum.into(%{

      })
      |> Api.Schedulers.create_scheduler()

    scheduler
  end
end
