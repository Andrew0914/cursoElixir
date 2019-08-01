defmodule MyProjectTest do
  use ExUnit.Case
  doctest MyProject

  test "greets the world" do
    assert MyProject.hello("Andrew") == "Hello Andrew !!"
  end
end
