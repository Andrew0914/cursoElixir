1..100 |> Enum.each(fn x ->
  spawn(fn ->
    send(piex, {:holi, "holi from #{inspect(self())}"})
  end)
end)

receive do
  {:hola, msg}
    -> IO.puts("msg hola: %{msg}")
  {:holi, msg}
    -> IO.puts("msg holi: %{msg}")
end