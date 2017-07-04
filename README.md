# ElixirElastic

A simple Elixir Elasticsearch HTTP client.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

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

3. In config/dev.exs, configure `elixir_elastic`:

  ```elixir
  # The default uri is http://127.0.0.1:9200
  config :elixir_elastic, :uri, "http://127.0.0.1:9200"
  ```

## Getting Started

1. Index a document:

  ```elixir
  import ElixirElastic

  put("/my_index/articles/1", [title: "elastic", content: "elasticsearch article content..."])
  # {:ok, 201,
  #  %{_id: "1", _index: "my_index", _type: "articles", _version: 1, created: true}}
  ```
2. Fetch the document:

  ```elixir
  get("/my_index/articles/1")
  #  {:ok, 200,
  #   %{_id: "1", _index: "my_index",
  #     _source: %{content: "elasticsearch ...", title: "elastic"}, _type: "articles",
  #     _version: 1, found: true}}
  ```
3. Simplified search:

  ```elixir
  get("/my_index/articles/_search?q=title:jane")
  #  {:ok, 200,
  #   %{_shards: %{failed: 0, successful: 5, total: 5},
  #     hits: %{hits: [%{_id: "1", _index: "my_index", _score: 0.30685282,
  #          _source: %{content: "elasticsearch ...", title: "elastic"}, _type: "articles"}],
  #       max_score: 0.30685282, total: 1}, timed_out: false, took: 10}}
  ```