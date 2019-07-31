defmodule WordCount do
  def count_words(file_path) do
    piex = self()
    {:ok, count} = case File.read(file_path) do
      {:ok, data} ->
        lines = String.split(data, "\n")
        
        Enum.each(lines, fn line ->
          spawn(fn ->
            send(piex, to_frequency_map(line))
          end)
        end)
        {:ok, length(lines)}
        
        error ->
          error
    end
    receive_responses(count) |> join()
  end

  def to_frequency_map(str) do
    String.replace(str, ~r/[,.]/, "")
    |> String.split(" ")
    
    |> Enum.reduce(%{}, fn word, acc ->
      Map.put(acc, word, Map.get(acc, word, 0) + 1)
    end)
  end

  def receive_responses(n) do
    1..n
    |> Enum.map(fn _i ->
      receive do
        map -> map
      end
    end)
  end

  def join(map_list) do
    Enum.reduce(map_list, %{}, fn new, acc ->
      Map.merge(new, acc, fn _k, v1, v2 -> v1 + v2 end)
    end)
  end
end