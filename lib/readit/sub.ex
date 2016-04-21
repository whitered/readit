defmodule Readit.Sub do
  @moduledoc """
  Defines struct and some functions for handling subreddits
  """
  defstruct name: ""
  alias Readit.Client
  alias Readit.Sub
  alias Readit.Post

  @doc """
  Create a new Readit.Sub struct

  Example:
      iex> Readit.Sub.new("aww")
      %Readit.Sub{name: "/r/aww"}
  """
  def new(name), do: %Sub{name: "/r/#{name}"}

  @doc """
  Gets all the recent posts from a subreddit
  """
  def recent(sub) do
    Client.get!("#{sub.name}/new.json").body
  end

  @doc """
  Gets first page of hot posts from a subreddit
  """
  def hot(sub) do
    Client.get!("#{sub.name}/hot.json").body
  end

  @doc """
  Gets all the recent image posts from a subreddit
  """
  def recent_images(sub) do
    sub
    |> recent
    |> Enum.filter(&Post.image?/1)
  end

  @doc """
  Gets all the recent image urls from a subreddit
  """
  def recent_image_urls(sub) do
    sub
    |> recent
    |> Stream.filter(&Post.image?/1)
    |> Enum.map(&Post.image/1)
  end
end
