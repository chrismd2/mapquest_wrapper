defmodule MapquestWrapperTest do
  use ExUnit.Case
  doctest MapquestWrapper

  test "greets the world" do
    assert MapquestWrapper.hello() == :world
  end
end
