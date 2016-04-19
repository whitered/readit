defmodule Readit.Sub do
  defstruct name: ""
  alias Readit.Client
  alias Readit.Sub
  alias Readit.Post

  def new(name), do: %Sub{name: "/r/#{name}"}

  def recent(sub) do
    Client.get!("#{sub.name}/new.json").body
  end

  def recent_images(sub) do
    sub
    |> recent
    |> Enum.filter(&Post.image?/1)
  end

  def recent_image_urls(sub) do
    sub
    |> recent
    |> Stream.filter(&Post.image?/1)
    |> Enum.map(&Post.image/1)
  end
end
