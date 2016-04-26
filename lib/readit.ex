defmodule Readit do
  @moduledoc """
  Readit is a simple, read-only reddit api client mostly suitable for getting
  images from a particular subreddit page.
  """

  @doc """
  Convenience function for easily creating a new Readit.Sub struct
  """
  def sub(name), do: Readit.Sub.new(name)
end
