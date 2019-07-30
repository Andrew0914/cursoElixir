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

  def area({:triangle, b,h}) do
    b * h / 2
  end

  def area(unknown) do
    {:error , {:unknown_shape , unknown}}
  end

end
# patter matching
#IO.puts Geometry.area({:rectangle , 22,4})
#IO.puts Geometry.area({:square , 20})
#IO.puts Geometry.area({:circle , 10})
#IO.puts Geometry.area({:square , 10 , 50}) # not match
#IO.puts Geometry.area({:triangle , 10 , 50}) 
