defmodule Geometry do

  def area({:rectangle, a, b}) do
    a* b
  end

  def area({:square, a}) do
    a* a
  end

  def area({:circle, r}) do
    r * r * 3.14
  end
end
# patter matching
IO.puts Geometry.area({:rectangle , 22,4})
IO.puts Geometry.area({:square , 20})
IO.puts Geometry.area({:circle , 10})
IO.puts Geometry.area({:square , 10 , 50}) # not match
