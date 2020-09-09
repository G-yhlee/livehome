defmodule StockWeb.Mylib.Link do
  def link_by_ticker_and_type(ticker,type) do
    base = "https://cloud.iexapis.com/stable/stock/"
    method_intraday ="/intraday-prices?"
    method_cap ="/quote?"
    token= "token=pk_6b5ca3998a2446fbaf446edc35d72447"
    case type do
      :intraday ->"#{base}#{ticker}#{method_intraday}#{token}"
      :cap -> "#{base}#{ticker}#{method_cap}#{token}"
    end
  end
  def parse_link_by_ticker_and_type( ticker , type ) do
    ticker
    |> link_by_ticker_and_type(type)
    |> HTTPoison.get!
    |> (fn json -> json.body end).()
    |> Jason.decode!
  end



end
