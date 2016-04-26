defmodule Readit.TestClient do
  def get!(url) do
    send self, {:get, url: url}
    %{body: [
      %{url: "test.jpg"},
      %{url: "test.txt"}
    ]}
  end
end
