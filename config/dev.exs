use Mix.Config

# Read from environment variables
config :ex_binance, api_key:    System.get_env("BINANCE_API_KEY"),
                 api_secret:    System.get_env("BINANCE_API_SECRET")
