defmodule Api.Schedulers.SchedulerGenserver do
  use GenServer
  alias Api.Schedulers

  def init(arg) do
    {:ok, arg}
  end

  def start_link(arg) do
    Schedulers.newsletter_boosttrap()

    GenServer.start_link(__MODULE__, arg)
  end
end
