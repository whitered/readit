defmodule Readit.SubTest do
  use ExUnit.Case, async: true
  alias Readit.Sub

  test "new creates a new Sub struct" do
    assert %Sub{name: "/r/test"} = Sub.new("test")
  end

  test "recent gets the /new feed from reddit" do
    "test" |> Sub.new |> Sub.recent
    assert_received {:get, url: "/r/test/new.json"}
  end

  test "hot gets the /hot feed from reddit" do
    "test" |> Sub.new |> Sub.hot
    assert_received {:get, url: "/r/test/hot.json"}
  end

  test "recent_images returns posts that have images" do
    sub = Sub.new("test")
    assert [%{url: "test.jpg"}] = Sub.recent_images(sub)
  end

  test "hot_images returns posts that have images" do
    sub = Sub.new("test")
    assert [%{url: "test.jpg"}] = Sub.hot_images(sub)
  end
end
