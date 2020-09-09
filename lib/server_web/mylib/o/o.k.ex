defmodule ServerWeb.Mylib.O.K do
  def set(o,k,v) do
    case o |> Map.has_key?(k) do
      true -> o
      false -> put(o,k,v)
    end
  end
 def put_v(o,k,v) do
   Map.put(o,k,v)
 end
  def put(o,k,v) do
    case v |> is_function do
       false ->  o |> Map.put(k,v)
       true -> case v |> is_function(1) do
                  true -> o |> Map.put(k,v.(o))
                  false -> o |> Map.put(k,v.(o,k))
               end
    end
  end
  def use(o,k,f) do
    f.(o,k)
    o
  end
  def receiver(_o) do
    receive do
      a -> a
    end

  end
  def receiver2(o) do
    receive do
      a -> a
      after 0 -> o
    end

  end

  def case?(o,f) do
    o |> Map.put(:case, f.(o)  )
  end
  def case_run(o,if_true_run,if_false_or_nil_run) do
    case o[:case] do
       true -> if_true_run.(o)
       _ ->    if_false_or_nil_run.(o)
    end
  end
  def copy(o,key1,key2) do
    o |> Map.put(key2, o[key1])
  end




end
