defmodule ElixirCupsTest do
  use ExUnit.Case
  doctest ElixirCups

  test "greets the world" do
    assert ElixirCups.hello() == :world
  end
end
