defmodule ReaditTest do
  use ExUnit.Case, async: true

  test "sub makes a new sub" do
    assert %Readit.Sub{name: "/r/aww"} = Readit.sub("aww")
  end
end
