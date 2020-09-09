defmodule ServerWeb.Mylib.O.MOD_STOCK do
  alias ServerWeb.Mylib.O
  alias ServerWeb.Mylib.T
  alias StockWeb.Mylib.V
  alias ServerWeb.Data
  alias ServerWeb.Mylib.O.K.Helper
  def process_stock(o) do
    o
    |> T.io("입력")
    |> O.K.put_v(:PID_list_all,Process.list()|>length)
    |> O.K.set(:V_PID2,&(O.start(&1)))
    |> O.K.set(:V_PID1,self())
    |> O.K.set(:ticker_list,Data.tickerlist())
    |> O.K.put_v(:mod_stock?,true)
    |> O.K.use(:V_PID2,&(send(&1[&2],{:merge,&1})))
    |> O.K.case?(&(Helper.maybe_has_key?(&1,&1[:ticker_list])))
    |> O.K.case_run(&(&1),&(O.MOD_STOCK.stock_P2PX( &1 )))
    |> O.K.use(:V_PID2,&(send(&1[&2],{:call,&1[:V_PID1]})))

  end
  def stock_P2PX(o) do
    for ticker <- o[:ticker_list] do
      o
      |> O.K.put_v(:temp_pid,O.start(%{}))
      |> O.K.put_v(:F_get_stock,&V.get_data_by_ticker_of_intraday/1)
      |> O.K.use(:temp_pid,&(send(&1[&2],{:put,{:"V_ticker_#{ticker}",&1[:F_get_stock],ticker}})))
      |> O.K.use(:temp_pid,&(send(&1[&2],{:call,&1[:V_PID2]})))
      |> O.K.use(:temp_pid,&(send(&1[&2],{:xcall,&1[:temp_pid]})))
    end
    o
  end
  def process_style(o) do
    o
    |> O.K.put_v(:style_f, &(&1) )
    |> O.K.put(:style, "color: #d5dae6;background-color:#373f52;text-align:center;" )
  end


end
