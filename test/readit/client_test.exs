defmodule Readit.ClientTest do
  use ExUnit.Case, async: true
  alias Readit.Client

  test "process_url callback adds the domain to the path" do
    assert Client.process_url("/path") == "https://www.reddit.com/path"
  end

  test "process_response_body parses and maps the response (excluding unknown keys)" do
    response_body = """
    {"data":{
      "children":[
        {"data":{"url": "test.jpg", "other_thing": true}},
        {"data":{"url": "test.txt"}}]}}
    """
    parsed = [%{url: "test.jpg"}, %{url: "test.txt"}]
    assert parsed == Client.process_response_body(response_body)
  end
end
