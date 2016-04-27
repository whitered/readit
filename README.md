# Readit

Readit is a simple, read-only reddit api client mostly
suitable for getting images from a particular subreddit
page.

## Installation

The package can be installed as:

  1. Add readit to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:readit, "~> 0.0.1"}]
    end
    ```

  2. Ensure readit is started before your application:

    ```elixir
    def application do
      [applications: [:readit]]
    end
    ```

## Usage

  1. Create a `Sub` struct

    ```elixir
    sub = Readit.sub("aww")
    #=> %Readit.Sub{name: "/r/aww"}
    ```

  2. Use `Readit.Sub` to query the sub

    ```elixir
    post = sub |> Readit.Sub.hot |> hd
    #=> %{...}
    ```

  3. A post is just a `Map`, but the `Readit.Post` module provides some convenience functions for querying them.

    ```elixir
    post.title
    #=> "One of them left his parking brake engaged"
    post.ups
    #=> 5475
    Readit.Post.nsfw?(post)
    #=> false
    Readit.Post.image?(post)
    #=> true
    Readit.Post.image(post)
    #=> http://i.imgur.com/rh8Y5PS.gif
    ```

See [the docs](https://hexdocs.pm/readit) for more info.
