defmodule Readit.PostTest do
  use ExUnit.Case, async: true
  alias Readit.Post

  test "image? is true if the post contains an image" do
    post = %{url: "image.png"}
    assert Post.image?(post)
  end

  test "image? is false if the post does not contain an image" do
    post = %{url: "text.txt"}
    refute Post.image?(post)
  end

  test "image returns the url if it is an image" do
    post = %{url: "image.png"}
    assert Post.image(post) == "image.png"
  end

  test "image returns nil if it is not an image" do
    post = %{url: "text.txt"}
    assert Post.image(post) == nil
  end

  test "nsfw? is true when post is marked over 18" do
    post = %{over_18: true}
    assert Post.nsfw?(post)
  end

  test "nsfw? is false when post is not marked over 18" do
    post = %{over_18: false}
    refute Post.nsfw?(post)
  end
end
