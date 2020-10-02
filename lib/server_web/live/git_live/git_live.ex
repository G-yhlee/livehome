defmodule ServerWeb.GitLive do
  use ServerWeb, :live_view
  alias ServerWeb.V
  alias ServerWeb.Mylib.HTML
  # use Timex
  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end
  def sorted_ls do
    # path = "/Users/tutrim/Desktop/git/livehome/lib/server_web/live/git_live/"
    path = "/Users/tutrim/Desktop/git/.git/"
    path
    |> File.ls!
    |> Enum.map(&{&1, File.stat!(path <> &1).ctime}) # {파일이름 , 시각}
    # |> Enum.sort(fn ({_fnm1, time1}, {_fnm2, time2}) -> time1 >= time2 end) # 최신순
  end

  def time(:now) do
    {{year,month,dat},{hour,minute,second}}=:calendar.universal_time
  end
  def time_ago( t1 ) do
    t2 = :calendar.universal_time
    {days, {h,m,s}} = :calendar.time_difference(t1,t2)
    case [days,h,m,s] |> Enum.drop_while(&(&1==0)) |> length do
      1 -> "#{s} seconds ago"
      2 -> "#{m} minutes ago"
      3 -> "#{h} hours ago"
      4 -> "#{days} days ago"
    end
  end
end
