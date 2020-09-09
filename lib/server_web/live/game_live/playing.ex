defmodule ServerWeb.GameLive.Playing do
  use ServerWeb, :live_view
  alias Server.Game
  alias ServerWeb.Data
  @rotate_keys ["ArrowUp"]
  @bottom_keys [" ","ArrowDown"]
  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(500,self() , :tick1)
    end
    {:ok, new_game(socket)}
  end
  def handle_info(:tick1, socket) do
    {
      :noreply,
      socket
      |> down
      |> maybe_end_game
    }
  end

  defp render_board(assigns) do
    ~L"""
    <svg width="200" height="400">
      <rect width="400" height="400" style="fill:rgb(50,50,50);" />
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
  defp color(:l), do: "AAPL"
  defp color(:l2), do: "INTC"
  defp color(:j), do: "TWTR"
  defp color(:s), do: "KO"
  defp color(:z), do: "TSLA"
  defp color(:o), do: "BIDU"
  defp color(:i), do: "NFLX"
  defp color(:t), do: "AMZN"
  defp color(_),  do: random_stock_img()

  defp new_game(socket) do
    assign(socket, game: Game.new())
  end

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
  end

  def down(%{assigns: %{game: game}}=socket) do
    assign(socket, game: Game.down(game,socket[:o1]))
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
    {:noreply, socket |> bottom}
  end

  def handle_event("keystroke", %{"key" => "ArrowRight"}, socket) do
    {:noreply, socket |> right}
  end

  def handle_event("keystroke", %{"key" => "ArrowLeft"}, socket) do
    {:noreply, socket |> left}
  end

  def handle_event("keystroke", _, socket) do
    {:noreply, socket}
  end
end
