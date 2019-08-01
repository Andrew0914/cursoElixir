defmodule WordCountTest do
    use ExUnit.Case
    doctest WordCount
  
    test "Testing get frequency of words of a file" do
      assert WordCount.of("lorem_ipsum_1.txt") == %{
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
    end

    test "Testing gets frequency of words of a line" do
        assert WordCount.word_count("rojo verde amarillo rojo verde azul") == %{
            "rojo" => 2,
            "verde" => 2,
            "amarillo" => 1,
            "azul" => 1
          }
        
    end
  end