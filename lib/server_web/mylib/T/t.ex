defmodule ServerWeb.Mylib.T do
  # 서버 테스트
  def io(d,_msg) do
    #IO.inspect("=============pid: #{inspect self()}=================")
    # IO.inspect("msg: #{msg} ")
    # IO.inspect(DateTime.now!("Etc/UTC") |>  DateTime.add(3600*9, :second))
    # IO.inspect( inspect d|> String.slice(0..10)) # 테스트모드 == off
    # IO.inspect(d)
    d
  end
  def io2(d,msg) do
    #IO.inspect("=============pid: #{inspect self()}=================")
    IO.inspect("msg: #{msg} ")
    # IO.inspect( Map.get(:case) )
    IO.inspect( d) # 테스트모드 == off
    IO.inspect("msgend: #{msg} ")
    d
  end
  def delay_1(a) do
    Process.sleep(1000)
    a
  end

  def delay_t(a,t) do
    Process.sleep(t)
    a
  end
end
