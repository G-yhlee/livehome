defmodule ServerWeb.Mylib.O.MOD_TETRIS do
  alias ServerWeb.Mylib.O
  # alias ServerWeb.Mylib.T
  def process(o) do
    o
    |> O.K.put_v(:PID_list_all,Process.list()|>length)
    |> O.K.put_v(:F_timer,&timer_inner/1)
    |> O.K.set(:V_PID2,&(O.start(&1)))
    |> O.K.set(:V_PID1,self())
    |> O.K.case?(&(&1.click == "PLAY"))
    |> O.K.case_run( &(&1 |> Map.put(:click,"STOP")) , &(&1 |> Map.put(:click,"PLAY")) )
    # 타이머 on / off
    |> O.K.case_run(&(&1|>timer(true)),&(&1 |> timer(false)))
    # |> O.K.put_v(:time_handle, time_hanler() )
    |> O.K.use(:V_PID2,&(send(&1[&2],{:merge,&1})))
    |> O.K.use(:V_PID2,&(send(&1[&2],{:call,&1[:V_PID1]})))
  end
  def timer(o,case?) do
    case case? do
      true -> IO.inspect("뭐야 투르")
              o
              |> O.K.put_v(:temp_pid,O.start(%{}))
              |> O.K.use(:temp_pid,&(send(&1[&2],{:put,{:temp_timer,&1[:F_timer],&1 }})))
      false -> IO.inspect("뭐야 폴스")
              o
              # |> O.K.use(:temp_pid,&(send(&1[&2],{:xcall,&1[:temp_pid]})))
              |> O.K.use(:temp_pid,&(:timer.kill_after(1500,&1[&2] )  ))
    end
  end
  def timer_inner(o) do
    :timer.send_interval(500, o[:V_PID1], :tick)
    o
  end

end
