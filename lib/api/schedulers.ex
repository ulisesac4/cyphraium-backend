defmodule Api.Schedulers do
  @moduledoc """
  The Schedulers context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo
  alias Api.Newsletters

  alias Api.Schedulers.Scheduler
  alias Crontab

  def init() do
    newsletter_boosttrap()
  end

  @doc """
  Returns the list of schedulers.

  ## Examples

      iex> list_schedulers()
      [%Scheduler{}, ...]

  """
  def list_schedulers do
    raise "TODO"
  end

  @doc """
  Gets a single scheduler.

  Raises if the Scheduler does not exist.

  ## Examples

      iex> get_scheduler!(123)
      %Scheduler{}

  """
  def get_scheduler!(id), do: raise("TODO")

  @doc """
  Creates a scheduler.

  ## Examples

      iex> create_scheduler(%{field: value})
      {:ok, %Scheduler{}}

      iex> create_scheduler(%{field: bad_value})
      {:error, ...}

  """
  def create_scheduler(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
    Updates a scheduler.

    ## Examples

        iex> update_scheduler(scheduler, %{field: new_value})
        {:ok, %Scheduler{}}

        iex> update_scheduler(scheduler, %{field: bad_value})
        {:error, ...}


    def update_scheduler(%Scheduler{} = scheduler, attrs) do
      raise "TODO"
    end
  """

  @doc """
    Deletes a Scheduler.

    ## Examples

        iex> delete_scheduler(scheduler)
        {:ok, %Scheduler{}}

        iex> delete_scheduler(scheduler)
        {:error, ...}


    def delete_scheduler(%Scheduler{} = scheduler) do
      raise "TODO"
    end
  """

  @doc """
  Returns a data structure for tracking scheduler changes.

  ## Examples

      iex> change_scheduler(scheduler)
      %Todo{...}


  def change_scheduler(%Scheduler{} = scheduler, _attrs \\ %{}) do
    raise "TODO"
  end
  """

  def newsletter_boosttrap() do
    IO.inspect("Loading Newsletters...")
    newsletters = Newsletters.list_unsend_newsletters()
    # IO.inspect(newsletters)
    x =
      Crontab.CronExpression.Composer.compose(%Crontab.CronExpression{
        day: [25],
        hour: [22],
        minute: [20],
        month: [3],
        year: [2022]
      })

    IO.inspect(x)
    IO.inspect("Newsletters loaded...")
  end
end
