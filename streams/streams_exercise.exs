defmodule FizzBuzzTake do

    def fizz_buzz(x) do
            cond do
                rem(x,3) == 0 && rem(x,5) == 0 -> IO.puts("FizzBuzz")
                rem(x,3) == 0 -> IO.puts("Fizz")
                rem(x,5) == 0 -> IO.puts("Buzz")
                true -> IO.puts(x)
            end

    end

    def fizz_buzz_take(take) do
        Stream.iterate(1, &(&1 +1)) |> Stream.map(&fizz_buzz/1) |> Enum.take(take)
    end

end
# Los streams hacem computo perezoso, es decir se programa al procesamiento pero no se hace hasta que lo solicitas
# por ejemplo aqui se genera una secuencia infinita de numeros naturales, pero no se itera el infinito solo hasta que pides en este caos los primos n mnumeros
FizzBuzzTake.fizz_buzz_take(15)