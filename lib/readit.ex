defmodule Readit do
  alias Readit.Sub

  @doc """
  Create a new Readit.Sub struct
  """
  def sub(name), do: Sub.new(name)
end
