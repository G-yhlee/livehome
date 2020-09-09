defmodule ServerWeb.HomeLive do
  use ServerWeb, :live_view
  alias ServerWeb.V
  alias ServerWeb.Mylib.HTML
  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end
end
