defmodule ExBinance do
  @moduledoc """
  Binance API client.
  """

  defdelegate ping, to: ExBinance.Market, as: :ping
  defdelegate get_time, to: ExBinance.Market, as: :get_time
  defdelegate market_info, to: ExBinance.Market, as: :info
  defdelegate order_book, to: ExBinance.Market, as: :order_book
  defdelegate trades, to: ExBinance.Market, as: :trades
  defdelegate aggregate_trades, to: ExBinance.Market, as: :aggregate_trades
  defdelegate historical_trades, to: ExBinance.Market, as: :historical_trades
  defdelegate klines, to: ExBinance.Market, as: :klines
  defdelegate prices_24hr, to: ExBinance.Market, as: :prices_24hrs
  defdelegate all_prices, to: ExBinance.Market, as: :all_prices
  defdelegate all_books, to: ExBinance.Market, as: :all_books

  defdelegate account_info, to: ExBinance.User, as: :
  defdelegate my_trades, to: ExBinance.User, as: :trades
  defdelegate create_order, to: ExBinance.User, as: :create_order
  defdelegate test_create_order, to: ExBinance.User, as: :test_create_order
  defdelegate check_order, to: ExBinance.User, as: :check_order
  defdelegate check_client_order, to: ExBinance.User, as: :check_client_order
  defdelegate open_orders, to: ExBinance.User, as: :open_orders
  defdelegate all_orders, to: ExBinance.User, as: :all_orders
  defdelegate withdraw, to: ExBinance.User, as: :withdraw
  defdelegate deposit_history, to: ExBinance.User, as: :deposit_history
  defdelegate withdraw_history, to: ExBinance.User, as: :withdraw_history
  defdelegate deposit_address, to: ExBinance.User, as: :deposit_address

  defdelegate start_user_data_stream, to: ExBinance.User, as: :start_user_data_stream
  defdelegate keepalive_user_data_stream, to: ExBinance.User, as: :keepalive_user_data_stream
  defdelegate close_user_data_stream, to: ExBinance.User, as: :close_user_data_stream

end
