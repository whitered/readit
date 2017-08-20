defmodule Readit.TestClient do
  @moduledoc """
  This is an http client stub used in tests
  """

  @doc """
  Stubs the `get!` function for testing
  """
  def get!(url) do
    send(self(), {:get, url: url})
    %{body: [
      %{url: "test.jpg"},
      %{url: "test.txt"}
    ]}
  end
end
