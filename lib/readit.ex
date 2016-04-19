defmodule Readit do
  alias Readit.Sub

  @doc """
  Create a new Readit.Sub struct

  Example:
      iex> Readit.sub("aww")
      %Readit.Sub{name: "/r/aww"}
  """
  def sub(name), do: Sub.new(name)

  @doc """
  Gets all the recent images from a subreddit
  """
  def images_from_sub(name) do
    name
    |> Sub.new
    |> Sub.recent_image_urls
  end

  @doc """
  Gets a random image from the subreddit
  """
  def random_image_from_sub(name) do
    name
    |> images_from_sub
    |> Enum.random
  end
end
