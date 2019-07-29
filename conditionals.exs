defmodule Conditional do

    def fizz_buzz(x) do
        cond do
            rem(x,3) == 0 && rem(x,5) == cl0 -> IO.puts("FizzBuzz")
            rem(x,3) == 0 -> IO.puts("Fizz")
            rem(x,5) == 0 -> IO.puts("Buzz")
            true -> IO.puts(x)
        end
    end
end

Enum.each(1..100, &Conditional.fizz_buzz/1)
