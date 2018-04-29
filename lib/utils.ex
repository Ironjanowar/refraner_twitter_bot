defmodule RefranerTwitterBot.Utils do
  defp format_key(key) when is_atom(key), do: key |> Atom.to_string()

  defp format_key(key) when is_binary(key) do
    key
    |> String.split("_")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end

  defp filter_null_params(list) do
    Enum.filter(list, fn {_, v} -> v != nil end)
  end

  def pretty_refran_info(refran) do
    Map.to_list(refran) |> filter_null_params() |> pretty_refran_info("")
  end

  defp pretty_refran_info([{_, nil} | rest], string) do
    pretty_refran_info(rest, string)
  end

  # Skip id
  defp pretty_refran_info([{"id", _} | rest], string) do
    pretty_refran_info(rest, string)
  end

  defp pretty_refran_info([{"refran", refran} | rest], string) do
    formatted_key = format_key("refran")
    pretty_refran_info(rest, "#{formatted_key}: #{refran}\n\n" <> string)
  end

  defp pretty_refran_info([{key, info} | rest], string) do
    formatted_key = format_key(key)
    pretty_refran_info(rest, string <> "#{formatted_key}: #{info}\n")
  end

  defp pretty_refran_info([_ | rest], string) do
    pretty_refran_info(rest, string)
  end

  defp pretty_refran_info([], string) do
    string
  end
end
