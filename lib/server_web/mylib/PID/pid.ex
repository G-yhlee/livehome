defmodule ServerWeb.PID do
  alias ServerWeb.Mylib.O
  # alias ServerWeb.Mylib.T
  def pid_stock(o,%{click_button: button} ) do
    o
    |> O.K.put(button,&(&1[&2]+1))
    |> O.K.put(:state, &(&1[:+]-&1[:-]) )
    |> O.MOD_STOCK.process_style
    |> O.MOD_STOCK.process_stock
    |> O.K.receiver
  end
  def pid_stock(o,%{click_auto: button} ) do
    o
    |> O.K.put(button,&(&1[&2]+1))
    |> O.K.put(:auto_state,&(rem(&1[:auto],2)  )  )
    |> O.K.case?(&(&1[:auto_state] == 1))
    |> O.K.case_run(&(&1 |> time_attack),&(&1|> time_attack_stop))
  end
  def pid_stock(o,%{click_logo: logo} ) do
    IO.inspect(logo|>String.slice(9..100))
    case o[:click] == logo do
       true ->  o
                |> O.K.put_v(:click,nil)
       false ->  o
                |> O.K.put_v(:click,logo)

    end

  end

  def pid_tetris(o,click) do
    o
    |> O.K.put_v(:click,click)
    |> O.MOD_TETRIS.process
    |> O.K.receiver
  end

  def time_attack(o) do
    {:ok, ref} = :timer.send_interval(1_000, self(), :++)
    o |> Map.put(:time_ref, ref)
  end
  def time_attack_stop(o) do
    :timer.cancel(o[:time_ref])
    o
  end



end
