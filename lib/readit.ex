defmodule Readit do
  alias Readit.Sub

  def sub(name), do: Sub.new(name)

  def images_from_sub(name) do
    name
    |> Sub.new
    |> Sub.recent_image_urls
  end

  def random_image_from_sub(name) do
    name
    |> images_from_sub
    |> Enum.random
  end
end
