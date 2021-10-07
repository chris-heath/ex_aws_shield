defmodule ExAws.ShieldTest do
  use ExUnit.Case
  doctest ExAws.Shield

  test "greets the world" do
    assert ExAws.Shield.hello() == :world
  end
end
