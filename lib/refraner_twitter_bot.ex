defmodule RefranerTwitterBot do
  def tweet do
    {:ok, full_refran} = Refraner.get_random_refran()

    full_refran
    |> RefranerTwitterBot.Utils.pretty_refran_info()
    |> ExTwitter.update()
  end
end
