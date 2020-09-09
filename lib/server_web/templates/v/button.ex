defmodule ServerWeb.V.Button do
  def button_name(event,o) do
    case event do
       "+" -> "+"
       "-" -> "-"
       "?" -> "?"
       "auto" -> case o[:auto_state] do
          0 -> "play"
          1 -> "stop"
       end
    end
  end

end
