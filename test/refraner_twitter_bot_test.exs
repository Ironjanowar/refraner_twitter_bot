defmodule RefranerTwitterBotTest do
  use ExUnit.Case
  doctest RefranerTwitterBot

  test "greets the world" do
    assert RefranerTwitterBot.hello() == :world
  end
end
