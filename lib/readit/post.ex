defmodule Readit.Post do
  @image_types ~w(png jpg jpeg gif gifv)

  def image?(post) do
    ext = post.url
          |> String.split(".")
          |> Enum.reverse
          |> hd
          |> String.downcase
    ext in @image_types
  end

  def image(post) do
    cond do
      image?(post) -> post.url
      true -> nil
    end
  end

  def nsfw?(post), do: post.over_18
end
