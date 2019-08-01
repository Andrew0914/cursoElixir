defmodule WordCount do
  def of(file_name) do
    file_name
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(fn str -> Task.async(fn -> word_count(str) end) end) 
    |> Enum.map(fn task -> Task.await(task) end)
    |> Enum.reduce(%{}, &merge_counts/2)
  end
  
  def word_count(line) do
    line
    |> String.replace(~r/[.,]/, "")
    |> String.downcase()
    |> String.split()
    |> Enum.reduce(%{}, &update_count/2)
  end

  def update_count(word, map) do
    Map.update(map, word, 1, &(&1 + 1))
  end
  
  def merge_counts(m1, m2) do
    Map.merge(m1, m2, fn _k, v1, v2 -> v1 + v2 end) 
  end
end