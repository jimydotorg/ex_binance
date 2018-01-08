defmodule ExBinance.Api do
  @moduledoc """
  Provides basic HTTP interface with REST API.
  """
  alias ExBinance.Config

  def get(path, params \\ %{}, config \\ nil) do
    config = Config.config_or_env_config(config)
    path = build_query_path(path, params)

    url(path, config)
    |> HTTPoison.get(headers("GET", config))
    |> parse_response()
  end

  def signed_get(path, params \\ %{}, config \\ nil) do
    config = Config.config_or_env_config(config)
    path = build_query_path(path, params, config.api_secret)

    url(path, config)
    |> HTTPoison.get(headers("GET", config))
    |> parse_response()
  end

  def post(path, params \\ %{}, config \\ nil) do
    config = Config.config_or_env_config(config)
    query = as_signed_query(params, config.api_secret)
    
    url(path, config)
    |> HTTPoison.post(query, headers("POST", config))
    |> parse_response()
  end

  def put(path, params \\ %{}, config \\ nil) do
    config = Config.config_or_env_config(config)
    query = as_signed_query(params, config.api_secret)
    
    url(path, config)
    |> HTTPoison.put(query, headers("PUT", config))
    |> parse_response()
  end

  def delete(path, params \\ %{}, config \\ nil) do
    config = Config.config_or_env_config(config)
    query = as_signed_query(params, config.api_secret)
    
    HTTPoison.request(:delete, url(path, config), query, headers("DELETE", config))
    |> parse_response()
  end

  defp url(path, config), do: config.api_url <> path

  defp build_query_path(path, params, api_secret \\ nil) do
    query = case api_secret do
      nil -> 
        params |> as_query
      _ -> 
        params |> as_signed_query(api_secret)
    end

    String.trim_trailing(path <> "?" <> query, "?")
  end

  defp as_query(%{} = params) do
    URI.encode_query(params)
  end

  defp as_signed_query(%{} = params, api_secret) do
    timestamp = :os.system_time(:millisecond)
    query_with_timing = case params |> as_query do
      "" -> "recvWindow=5000&timestamp=#{timestamp}"
      query -> "#{query}&recvWindow=5000&timestamp=#{timestamp}"
    end

    signature = :crypto.hmac(:sha256, api_secret, query_with_timing) |> Base.encode16(case: :lower)

    "#{query_with_timing}&signature=#{signature}"
  end

  defp headers(method, config) do
    case String.upcase(method) do
      "GET" -> [ "X-MBX-APIKEY": config.api_key ] 
      _ -> [ "Content-Type": "application/x-www-form-urlencoded", "X-MBX-APIKEY": config.api_key ]
    end
  end

  defp parse_response(response) do
    case response do
      {:ok, %HTTPoison.Response{body: body, status_code: code}} ->
        if code in 200..299 do
          {:ok, Poison.decode!(body)}
        else
          {:error, Poison.decode!(body)["message"], code}
        end
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end
