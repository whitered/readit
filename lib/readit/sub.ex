defmodule Readit.Sub do
  @moduledoc """
  Defines struct and some functions for handling subreddits
  """

  defstruct name: ""
  alias Readit.Sub
  alias Readit.Post

  @doc """
  Create a new Readit.Sub struct
  """
  def new(name), do: %Sub{name: "/r/#{name}"}

  @doc """
  Gets all the recent posts from a subreddit
  """
  def recent(sub) do
    http.get!("#{sub.name}/new.json").body
  end

  @doc """
  Gets first page of hot posts from a subreddit
  """
  def hot(sub) do
    http.get!("#{sub.name}/hot.json").body
  end

  @doc """
  Gets all the recent image posts from a subreddit
  """
  def recent_images(sub) do
    sub
    |> recent
    |> just_images
  end

  @doc """
  Gets all the recent image posts from a subreddit
  """
  def hot_images(sub) do
    sub
    |> hot
    |> just_images
  end

  defp just_images(posts) do
    posts |> Enum.filter(&Post.image?/1)
  end

  defp http do
    case Mix.env do
      :test -> Readit.TestClient
      _     -> Readit.Client
    end
  end
end
