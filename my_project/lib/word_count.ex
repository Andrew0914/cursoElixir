defmodule WordCount do

    @doc """
    of function gets the frequency of words in a text

    ## Examples

        iex> WordCount.of("lorem_ipsum_1.txt")
        %{
          "adipiscing" => 1,
          "aliquam" => 1,
          "amet" => 1,
          "consectetur" => 1,
          "dolor" => 1,
          "elit" => 1,
          "fermentum" => 1,
          "ipsum" => 1,
          "lorem" => 1,
          "rutrum" => 1,
          "sit" => 1,
          "turpis" => 1
        }

    """
    def of(file_name) do
      file_name
      |> File.read!()
      |> String.split("\n")
      |> Enum.map(fn str -> Task.async(fn -> word_count(str) end) end) 
      |> Enum.map(fn task -> Task.await(task) end)
      |> Enum.reduce(%{}, &merge_counts/2)
    end
    
    @doc """
    of function gets the frequency of words in a text

    ## Examples

        iex> WordCount.word_count("rojo verde amarillo rojo verde azul")
        %{
          "rojo" => 2,
          "verde" => 2,
          "amarillo" => 1,
          "azul" => 1
        }

    """
    def word_count(line) do
      line
      |> String.replace(~r/[.,]/, "")
      |> String.downcase()
      |> String.split()
      |> Enum.reduce(%{}, &update_count/2)
    end
  
    defp update_count(word, map) do
      Map.update(map, word, 1, &(&1 + 1))
    end
    
    defp merge_counts(m1, m2) do
      Map.merge(m1, m2, fn _k, v1, v2 -> v1 + v2 end) 
    end
  end