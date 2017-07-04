defmodule ElixirElastic.ENV do
  @default_uri_env %URI{ authority: "127.0.0.1:9200", scheme: "http", host: "127.0.0.1", port: 9200 }
  @doc "Returns default environment such as `#{@default_uri_env}`"
  def default_uri_env(), do: @default_uri_env

  @doc """
  Returns the value over `System.get_env("ES_URI")` or `Application.get_env(:elixir_elastic, :uri)`.
  See `get_env/1` for more details.
  """
  def get_uri_env(), do: get_env(:uri)

  @doc false
  def get_env(:uri) do
    __unwrap__(System.get_env("ES_URI") || Application.get_env(:elixir_elastic, :uri))
  end

  @doc "Returns the value for `key` in `:elixir_elastic`' environment."
  def get_env(key) do
    Application.get_env(:elixir_elastic, key)
  end

  @doc "Returns all key-value pairs for `:elixir_elastic` application."
  def get_all_env(), do: Application.get_all_env(:elixir_elastic)


  defp __unwrap__(uri) when is_binary(uri), do: URI.parse(uri)
  defp __unwrap__(uri) when is_list(uri),   do: Map.merge(%URI{}, Enum.into(uri, %{}))
  defp __unwrap__(uri) when is_nil(uri),    do: __unwrap__(@default_uri_env)
  defp __unwrap__(%URI{} = uri),            do: uri
end