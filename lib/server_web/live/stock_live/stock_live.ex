defmodule ServerWeb.StockLive do
  use ServerWeb, :live_view
  alias ServerWeb.PID
  alias ServerWeb.V
  alias Server.Game
  alias ServerWeb.Data
  @rotate_keys ["w"]
  @bottom_keys ["s"]
  # alias ServerWeb.Mylib.HTML
  def mount(_params, _session, socket) do
    {:ok,
    socket
    |> assign(o1: %{+: 0, -: 0,state: 0, auto: 0, auto_state: 0 })
    |> assign( game: Map.get(socket.assigns, :game) || Game.new_ticker("aapl") )
    }
  end

  def handle_event("button", %{"click"=> button}, socket) do
    case button do
      "auto" ->  {:noreply,update(socket, :o1, fn o -> PID.pid_stock(o,%{click_auto: button|> String.to_atom}) end ) }
      _ ->  {:noreply,update(socket, :o1, fn o -> PID.pid_stock(o,%{click_button: button|> String.to_atom}) end ) }
    end
  end
  def handle_event("logo", %{"click"=> logo}, socket) do
    {:noreply,update(socket, :o1, fn o -> PID.pid_stock(o,%{click_logo: logo}) end ) }
  end
  def handle_info(:++, socket) do

    {:noreply,update(
      socket
      |> down
    |> maybe_end_game,
    :o1, fn o -> PID.pid_stock(o,%{click_button: :+}) end ) }
  end
  # def handle_info(:play, socket) do

  #   {:noreply,update(
  #     socket
  #     |> down
  #     |> maybe_end_game,


  #   :o1, fn o -> PID.pid_stock(o,%{click_button: :+}) end ) }
  # end
  def render_board(assigns) do
    ~L"""
    <svg width="300" height="300" style="
    display: grid ;
      color: white ; width: 300px;height: 300px;
      border: 1px solid #ccc;
      border-radius: 4px;
     " phx-window-keydown="keystroke">
      <rect width="300" height="300" style="fill:rgb(0,0,0);" />
      <%= render_points(assigns) %>
    </svg>
    """
  end
  defp render_points(assigns) do
    ~L"""
    <%= for {x, y, shape} <- @game.points ++ Game.junkyard_points(@game) do %>
      <image

      href="https://storage.googleapis.com/iex/api/logos/<%= color(shape) %>.png"
        width="20" height="20"
        x="<%= (x - 1) * 20 %>" y="<%= (y - 1) * 20 %>"
        style="fill:<%= color(shape) %>;" />
    <% end %>
    """
  end


  defp random_stock_img() do
    Data.tickerlist()
    |> Enum.random()
    |> String.upcase()
  end
  # "twtr","amzn","googl","aapl","tsla","ko","bidu","nflx","wmt",
  # "amzn","spg","nflx","ko","sqqq","intc","t",
  # defp color(:l), do: "AAPL"
  # defp color(:l2), do: "INTC"
  # defp color(:j), do: "TWTR"
  # defp color(:s), do: "KO"
  # defp color(:z), do: "TSLA"
  # defp color(:o), do: "BIDU"
  # defp color(:i), do: "NFLX"
  # defp color(:t), do: "AMZN"
  defp color(ticker), do: ticker |> Atom.to_string |> String.upcase
  # defp color(_),  do: random_stock_img()

  # defp new_game(socket) do
  #   assign(socket, game: Game.new())
  # end

  def rotate(%{assigns: %{game: game}}=socket) do
    assign(socket, game: Game.rotate(game))
  end

  def left(%{assigns: %{game: game}}=socket) do
    assign(socket, game: Game.left(game))
  end
  def bottom(%{assigns: %{game: game}}=socket) do
    assign(socket, game: Game.bottom(game))
  end

  def right(%{assigns: %{game: game}}=socket) do
    assign(socket, game: Game.right(game))
# update(socket, :o1, fn o -> PID.pid_stock(o,%{click_logo: logo}) end )
  end

  def down(%{assigns: %{game: game}}=socket) do
    assign(socket, game: Game.down(game,socket.assigns.o1[:click] ))
  end

  def maybe_end_game(%{assigns: %{game: %{game_over: true}}}=socket) do
    socket
    |> push_redirect(to: "/game/over?score=#{socket.assigns.game.score}")
  end
  def maybe_end_game(socket), do: socket



  def handle_event("keystroke", %{"key" => key}, socket) when key in @rotate_keys do
    {:noreply, socket |> rotate}
  end
  def handle_event("keystroke", %{"key" => key}, socket) when key in @bottom_keys do
    {:noreply, socket
    # |> down
    # |> maybe_end_game
     |> bottom
    }
  end

  def handle_event("keystroke", %{"key" => "d"}, socket) do
    {:noreply, socket |> right}
  end

  def handle_event("keystroke", %{"key" => "a"}, socket) do
    {:noreply, socket |> left}
  end

  def handle_event("keystroke", _, socket) do
    {:noreply, socket}
  end

end
