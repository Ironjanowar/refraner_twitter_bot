defmodule RefranerTwitterBot.Scheduler do
  use GenServer

  require Logger

  @schedule_time 24 * 60 * 60 * 1000

  # Client API
  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  # Server callbacks
  def init(state) do
    Logger.info("Scheduler started")
    {:ok, state, @schedule_time}
  end

  def handle_info(:timeout, state) do
    Logger.info("Sending scheduled tweet")

    case RefranerTwitterBot.tweet() do
      {:error, :econnrefused} -> Logger.info("Can not connect to Refraner Server")
      _ -> Logger.info("Tweet sent")
    end

    {:noreply, state, @schedule_time}
  end
end
