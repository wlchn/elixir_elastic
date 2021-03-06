# ElixirElastic

A simple Elixir Elasticsearch HTTP client.

## Installation

1. Add `elixir_elastic` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:elixir_elastic, "~> 0.1.0"}]
  end
  ```

2. Ensure `elixir_elastic` is started before your application:

  ```elixir
  def application do
    [applications: [:elixir_elastic]]
  end
  ```

## Configuration

In config/dev.exs, configure `elixir_elastic`:

  ```elixir
  # The default uri is http://127.0.0.1:9200
  config :elixir_elastic, :uri, "http://127.0.0.1:9200"
  ```

## Usage

1. Index a document:

  ```elixir
  import ElixirElastic

  put("/my_index/articles/1", [title: "faded", content: "You were the shadow to my light ..."])
  # {:ok, 201,
  #  %{_id: "1", _index: "my_index", _type: "articles", _version: 1, created: true}}
  ```
2. Fetch the document:

  ```elixir
  get("/my_index/articles/1")
  #  {:ok, 200,
  #   %{_id: "1", _index: "my_index",
  #     _source: %{content: "You were the shadow to my light ...", title: "faded"}, _type: "articles",
  #     _version: 1, found: true}}
  ```
3. Simplified search:

  ```elixir
  get("/my_index/articles/_search?q=title:faded")
  #  {:ok, 200,
  #   %{_shards: %{failed: 0, successful: 5, total: 5},
  #     hits: %{hits: [%{_id: "1", _index: "my_index", _score: 0.35987286,
  #          _source: %{content: "You were the shadow to my light ...", title: "faded"}, _type: "articles"}],
  #       max_score: 0.35987286, total: 1}, timed_out: false, took: 10}}
  ```