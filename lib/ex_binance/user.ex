defmodule ExBinance.User do
  @moduledoc """
  Private endpoints for order management and account management.
  """
  import ExBinance.Api

  def account_info do
    signed_get("/api/v3/account")
  end

  def trades(symbol, params) do
    params = params |> Map.put(:symbol, String.upcase(symbol))
    signed_get("/api/v3/myTrades", params)
  end

  def create_order(symbol, side, type, time_in_force, quantity, price, params \\ %{}) do
    params = %{
      symbol: String.upcase(symbol),
      side: side,
      type: type,
      timeInForce: time_in_force,
      quantity: quantity,
      price: price
    }
    |> Map.merge(params)

    post("/api/v3/order", params)
  end

  def test_create_order(symbol, side, type, time_in_force, quantity, price, params \\ %{}) do
    params = %{
      symbol: String.upcase(symbol),
      side: side,
      type: type,
      timeInForce: time_in_force,
      quantity: quantity,
      price: price
    }
    |> Map.merge(params)

    post("/api/v3/order/test", params)
  end

  def check_order(symbol, id) do
    params = %{
      symbol: String.upcase(symbol),
      orderId: id      
    }

    signed_get("/api/v3/order", params)
  end

  def check_client_order(symbol, id) do
    params = %{
      symbol: String.upcase(symbol),
      origClientOrderId: id      
    }

    signed_get("/api/v3/order", params)
  end

  def cancel_order(symbol, id) do
    params = %{
      symbol: String.upcase(symbol),
      origClientOrderId: id      
    }

    delete("/api/v3/order", params)
  end

  def cancel_client_order(symbol, id) do
    params = %{
      symbol: String.upcase(symbol),
      origClientOrderId: id      
    }

    delete("/api/v3/order", params)
  end

  def open_orders(symbol) do
    signed_get("/api/v3/order", %{ symbol: String.upcase(symbol) })
  end

  def all_orders(symbol, params \\ %{}) do
    params = params |> Map.put(:symbol, String.upcase(symbol))
    signed_get("/api/v3/allOrders", params)
  end

  def withdraw(params) do
    post("/wapi/v3/withdraw.html", params)
  end

  def deposit_history(params) do
    signed_get("/wapi/v3/depositHistory.html", params)
  end

  def withdraw_history(params) do
    signed_get("/wapi/v3/withdrawHistory.html", params)
  end

  def deposit_address(params) do
    signed_get("/wapi/v3/depositAddress.html", params)
  end

  def start_user_data_stream, do: post("/api/v1/userDataStream")
  def keepalive_user_data_stream, do: put("/api/v1/userDataStream")
  def close_user_data_stream, do: delete("/api/v1/userDataStream")

end
