defmodule StockWeb.Mylib.V do
  alias StockWeb.Mylib.Link
  # alias StockWeb.Helper.H
  def get_data_by_ticker_of_intraday(ticker) do
    Link.parse_link_by_ticker_and_type(ticker,:intraday)
  end
  def get_data_by_at_and_ticker_of_intraday(at,ticker) do
    Link.parse_link_by_ticker_and_type(ticker,:intraday)
    |> Enum.at(at)
  end
  def get_data_by_ticker_of_cap(ticker) do
    Link.parse_link_by_ticker_and_type(ticker,:cap)
    # |> Enum.at(at)
  end
  def list_ticker do
    # ["twtr","tsla","aapl","googl","amzn","spg","qqq","nflx","ko"]
    ["twtr"]
    # ["twtr","tsla",]
    # ["twtr","tsla","aapl",]
    # ["twtr","tsla","aapl","googl",]
    # ["twtr","tsla","aapl","googl","amzn",]
    # ["twtr","tsla","aapl","googl","amzn","spg",]
    # ["twtr","tsla","aapl","googl","amzn","spg","qqq",]
    # ["twtr","tsla","aapl","googl","amzn","spg","qqq","nflx"]
    # ["twtr","tsla","aapl","googl","amzn","spg","qqq","nflx","ko"]

  end
  def keywordlist_ticker(list_ticker) do
    list_ticker
    |> Enum.map( fn a -> {a |> String.to_atom, a} end )
  end
  def map_ticker(tickers) do
    tickers
    |> keywordlist_ticker
    # |> Enum.map(fn {ticker,_ticker}-> {ticker, get_data_by_ticker_of_intraday(ticker)} end)
    |> Enum.map(fn {ticker,_ticker}-> {ticker, fd( &get_data_by_ticker_of_intraday/1,ticker )} end)
  end
  def data_ticker(list_ticker \\ list_ticker()) do
    list_ticker
    |> map_ticker
    # |> Enum.at(0)
  end
  def fd( f, d) do
    caller = self()
    spawn( fn ->
      send(caller, f.(d) |> IO.inspect )
    end)
  end

end
