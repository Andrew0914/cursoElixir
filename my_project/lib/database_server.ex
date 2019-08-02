defmodule DatabaseServer do

  require Logger

  def start do
      spawn(fn ->
        initial_state = 0
        loop(initial_state)
    end)
  end

  defp loop(state) do
    new_state = receive do
      {:run_query, caller, query_def} ->
        send(caller, {:query_result, run_query(query_def)})
        n_state = state + 1
        Logger.info "Server #{inspect(self())} call Count #{n_state}"
        n_state
    end
    loop new_state
  end

  defp run_query(query_def) do
    :timer.sleep(2000)
    "#{query_def} result"
  end

end
