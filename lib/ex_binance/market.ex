defmodule ExBinance.Market do
  @moduledoc """
  Unauthenticated endpoints for retrieving market data.
  """
  import ExBinance.Api

  def ping, do: get("/api/v1/ping")
  def get_time, do: get("/api/v1/time")
  def info, do: get("/api/v1/exchangeInfo")

  def order_book(symbol, params \\ %{}) do
    get("/api/v1/depth", params |> add_symbol(symbol))
  end

  def trades(symbol, params \\ %{}) do
    get("/api/v1/trades", params |> add_symbol(symbol))
  end

  def aggregate_trades(symbol, params \\ %{}) do
    get("/api/v1/aggTrades", params |> add_symbol(symbol))
  end

  def historical_trades(symbol, params \\ %{}) do
    get("/api/v1/historicalTrades", params |> add_symbol(symbol))
  end

  def klines(symbol, interval \\ "1m", params \\ %{}) do
    get("/api/v1/klines", params |> add_symbol(symbol) |> Map.put(:interval, interval))
  end

  def prices_24hr(symbol) do
    get("/api/v1/ticker/24hr", %{} |> add_symbol(symbol))
  end

  def all_prices, do: get("/api/v1/ticker/allPrices")
  def all_books, do: get("/api/v1/ticker/allBookTickers")

  def price_ticker(symbol \\ nil) do
    case symbol do
      nil -> get("/api/v3/ticker/price", %{})
      _ -> get("/api/v3/ticker/price", %{} |> add_symbol(symbol))
    end
  end

  def book_ticker(symbol \\ nil) do
    case symbol do
      nil -> get("/api/v3/ticker/bookTicker", %{})
      _ -> get("/api/v3/ticker/bookTicker", %{} |> add_symbol(symbol))
    end
  end

  # Helpers:
  defp add_symbol(%{} = params, sym), do: params |> Map.put(:symbol, String.upcase(sym))

end