defmodule RedirectTest do
  use ExUnit.Case
  doctest Redirect

  test "greets the world" do
    assert Redirect.hello() == :world
  end
end
