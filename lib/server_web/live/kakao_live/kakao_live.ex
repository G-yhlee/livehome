defmodule ServerWeb.KakaoLive do
  use ServerWeb, :live_view
  alias ServerWeb.V
  alias StockWeb.Mylib.V2
  def mount(_params, _session, socket) do
    socket = assign(
      socket,
      o1: %{+: 0, -: 0,state: 0}
      )
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= V.render("menu.html", c: assigns) %> <br><BR>
    <%= {:safe,renderp()} %>

    """
  end



    # def link_by_ticker_and_type(ticker) do
    #   "https://cloud.iexapis.com/stable/stock/#{ticker}/intraday-prices?/quote?token=pk_6b5ca3998a2446fbaf446edc35d72447"
    # end
    def link_by_ticker_and_type(ticker) do
      "https://cloud.iexapis.com/stable/stock/#{ticker}/intraday-prices?token=pk_6b5ca3998a2446fbaf446edc35d72447"
    end

    def res do
      re = link_by_ticker_and_type("twtr")
      |> HTTPoison.get!
      re2 =  re.body
      Regex.replace(~r/\\/,re2,"")
      # |> (fn json -> json.body end).()
      # |> Jason.decode!
        end
  def renderp do
    #{inspect json}
        # #{inspect link_by_ticker_and_type("twtr")
    # |> HTTPoison.get!
    # |> (fn json -> json.body end).()
    # |> Jason.decode!}

        #{IO.inspect(link_by_ticker_and_type("twtr")
# |> HTTPoison.get!
# |> (fn json -> json.body end).()
# |> Jason.decode!,limit: :infinity)}
##{IO.inspect(jj(),limit: :infinity)}
#{inspect(res()   ,limit: :infinity)}
    """

    #{res()  }
    """
  end


end
