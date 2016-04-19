defmodule Readit.Client do
  @moduledoc """
  This is a client to access the reddit json api over http

  See documentation for HTTPoison.Base for more information
  """
  use HTTPoison.Base

  @expected_fields ~w(
    domain banned_by media_embed subreddit selftext_html selftext likes
    suggested_sort user_reports secure_media link_flair_text id from_kind
    gilded archived clicked report_reasons author media score approved_by
    over_18 hidden preview num_comments thumbnail subreddit_id hide_score edited
    link_flair_css_class author_flair_css_class downs secure_media_embed saved
    removal_reason post_hint stickied from is_self from_id permalink locked name
    created url author_flair_text quarantine title created_utc distinguished
    mod_reports visited num_reports ups
  )

  @doc "Callback for HTTPoison"
  def process_url(url), do: "http://www.reddit.com" <> url

  @doc "Callback for HTTPoison"
  def process_response_body(body) do
    body
    |> Poison.decode!
    |> get_in(["data", "children"])
    |> Enum.map(&atomize_keys/1)
  end

  defp atomize_keys(%{"data" => data}) do
    data
    |> Map.take(@expected_fields)
    |> Stream.map(fn({k, v}) -> {String.to_atom(k), v} end)
    |> Enum.into(%{})
  end
end
