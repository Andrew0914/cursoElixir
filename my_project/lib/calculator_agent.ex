defmodule CalculatorAgent do

  def start() do
    Agent.start_link(fn -> 0 end, name: __MODULE__)
  end


  def add(num) do
    Agent.update(__MODULE__, fn number -> number + num end )
  end

  def sub(num) do
    Agent.update(__MODULE__, fn number -> number - num end )
  end

  def mul(num) do
    Agent.update(__MODULE__, fn number -> number * num end )
  end

  def div(num) do
    Agent.update(__MODULE__, fn number -> number / num end )
  end

  def value() do
      Agent.get(__MODULE__ , fn number -> number end)
  end

end
