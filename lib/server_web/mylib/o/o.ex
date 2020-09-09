defmodule ServerWeb.Mylib.O do
alias ServerWeb.Mylib.O
# alias ServerWeb.Mylib.T
  def start(o), do: spawn(fn -> o  |> roof end)
  defp roof(o), do: o |> process |> roof
  defp process(o) do
    receive do
      {:merge, o1 } -> o |> Map.merge(o1)
      {:call, pid } -> send(pid,o)
      {:xcall,pid } -> o |> process_kill(pid)
      {:put,{k,f,v}}-> o |> O.K.set(k,f.(v))
      o1            -> o |> Map.merge(o1)
    end
  end
  def process_kill(o,pid) do
    Process.exit(pid,:kill)
    o
  end
end
