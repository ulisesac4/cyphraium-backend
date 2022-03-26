defmodule Api.Schedulers.SchedulerGenserver do
  use GenServer
  alias Api.Schedulers
  alias Api.Schedulers.SchedulerModule
  import Crontab.CronExpression

  def init(arg) do
    IO.inspect("I have started")

    {:ok, arg}
  end

  def start_link(arg) do
    IO.inspect("Another")
    Schedulers.newsletter_boosttrap()

    SchedulerModule.add_job({~e[1 * * * *], fn -> :ok end})

    GenServer.start_link(__MODULE__, arg)
  end
end
