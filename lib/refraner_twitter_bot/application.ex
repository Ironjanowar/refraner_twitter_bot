defmodule RefranerTwitterBot.Application do
  use Application

  require Logger

  def start(_type, _args) do
    children = [
      RefranerTwitterBot.Scheduler
    ]

    opts = [strategy: :one_for_one]

    case Supervisor.start_link(children, opts) do
      {:ok, _} = ok ->
        Logger.info("Starting Refraner Scheduler")
        ok

      error ->
        Logger.error("Error starting Refraner Scheduler")
        error
    end
  end
end
