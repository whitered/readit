defmodule Readit.Post do
  @moduledoc """
  Supplies some fuctions for handling reddit posts
  """
  @image_types ~w(png jpg jpeg gif gifv)

  @doc """
  Returns true if the post is an image
  """
  def image?(post) do
    ext = post.url
          |> String.split(".")
          |> Enum.reverse
          |> hd
          |> String.downcase
    ext in @image_types
  end

  @doc """
  Returns the image url if available
  """
  def image(post) do
    cond do
      image?(post) -> post.url
      true -> nil
    end
  end

  @doc """
  Returns true if the post is marked as over 18
  """
  def nsfw?(post), do: post.over_18
end
