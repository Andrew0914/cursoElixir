defmodule Counter do
  @doc """
  Start a new counter
  """
  def start_link do
    Agent.start_link(fn -> 1 end, name: __MODULE__)
  end

  @doc """
  Gets the next number
  """
  def next_number do
    Agent.get_and_update(__MODULE__, fn number -> {number, number + 1} end )
  end
end
