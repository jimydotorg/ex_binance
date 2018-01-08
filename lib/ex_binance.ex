defmodule ExBinance do
  @moduledoc """
  Binance API client.
  """

  defdelegate ping, to: ExBinance.Market, as: :ping
  defdelegate get_time, to: ExBinance.Market, as: :get_time
  defdelegate market_info, to: ExBinance.Market, as: :info
  defdelegate order_book(x, y), to: ExBinance.Market, as: :order_book
  defdelegate trades(x, y), to: ExBinance.Market, as: :trades
  defdelegate aggregate_trades(x, y), to: ExBinance.Market, as: :aggregate_trades
  defdelegate historical_trades(x, y), to: ExBinance.Market, as: :historical_trades
  defdelegate klines(x, y, z), to: ExBinance.Market, as: :klines
  defdelegate prices_24hr(x), to: ExBinance.Market, as: :prices_24hr
  defdelegate all_prices, to: ExBinance.Market, as: :all_prices
  defdelegate all_books, to: ExBinance.Market, as: :all_books
  defdelegate price_ticker(x), to: ExBinance.Market, as: :price_ticker
  defdelegate book_ticker(x), to: ExBinance.Market, as: :book_ticker

  defdelegate account_info, to: ExBinance.User, as: :account_info
  defdelegate my_trades(x, y), to: ExBinance.User, as: :trades
  defdelegate create_order(symbol, side, type, time_in_force, quantity, price, params), to: ExBinance.User, as: :create_order
  defdelegate test_create_order(symbol, side, type, time_in_force, quantity, price, params), to: ExBinance.User, as: :test_create_order
  defdelegate check_order(x, y), to: ExBinance.User, as: :check_order
  defdelegate check_client_order(x, y), to: ExBinance.User, as: :check_client_order
  defdelegate cancel_order(x, y), to: ExBinance.User, as: :cancel_order
  defdelegate cancel_client_order(x, y), to: ExBinance.User, as: :cancel_client_order
  defdelegate open_orders(x), to: ExBinance.User, as: :open_orders
  defdelegate all_orders(x,y), to: ExBinance.User, as: :all_orders
  defdelegate withdraw(x), to: ExBinance.User, as: :withdraw
  defdelegate deposit_history(x), to: ExBinance.User, as: :deposit_history
  defdelegate withdraw_history(x), to: ExBinance.User, as: :withdraw_history
  defdelegate deposit_address(x), to: ExBinance.User, as: :deposit_address

  defdelegate start_user_data_stream, to: ExBinance.User, as: :start_user_data_stream
  defdelegate keepalive_user_data_stream, to: ExBinance.User, as: :keepalive_user_data_stream
  defdelegate close_user_data_stream, to: ExBinance.User, as: :close_user_data_stream

end
