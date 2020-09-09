defmodule ServerWeb.Mylib.HTML do
  use ServerWeb, :live_view
  alias ServerWeb.Mylib.HTML.TAG

  def render do

  end
  def tag_(_tagnm,_content,_att) do
    {:safe, ["<", "input", [[32, "name", 61, 34, "user_id", 34], [32, "type", 61, 34, "text", 34]], 62]}
  end

  def tagg do
    tag = "h5 "
    att = "name = 1 class=3 hi = hi"
    content = "<h1>이런거였어?</h1>"
    {:safe,"<#{tag}#{att}>#{content}</#{tag}>"}
  end
  def tag1(obj \\%TAG{} ,tag) do
    case obj.tag == nil do
       true -> %{ obj| tag: tag}
      false -> %{ obj| content: tag(%TAG{},tag) }
    end
  end
  def att(obj,k,v) do
    obj |> Map.put(k,v)
  end
  def tag_flow do
    # tag(:h1)
    # |> att(name: "")
    # |> att(obj: 11)
        # |> tag(:div)
        # |> tag_end
        # |> tag(:h2)
        # |> tag("content")
        # |> tag_end
        # |> tag(:div)
            # |> tag(:h3)
            # |> tag("content")
            # |> tag_end
    # |> tab_end
    # |> tag_html
  end

  def svg do
    """
    <svg width="1200" height="1400" style="fill:rgb(50,50,50);">
    <rect width="800" height="800" style="fill:rgb(50,50,50);" />
    </svg>
    """

  end
  def svgl(assigns) do
    ~L"""
    <svg width="1200" height="1400" style="fill:rgb(50,50,50);">
    <rect width="800" height="800" style="fill:rgb(50,50,50);" />
    </svg>
    """

  end
  def render_points(assigns) do
    ~L"""
    <svg width="1200" height="1400" style="fill:rgb(50,50,50);">
    <rect width="800" height="800" style="fill:rgb(50,50,50);" />
    </svg>
    """
  end

  def tag_end(tag) do
    {:safe, tag}
  end
  # def tag(k) do
  #   [60, k , [], 62]
  # end
  # def tag_test(k) do
  #   [60, k , [], 62,"내용",60,47,62]
  # end

  # def att(tag, k,v ) do
  #   [32, k , 61, 34, v, 34]
  # end

  # tag(tagnm)
  # |> att
  # |> att
  # |> content
  # |> tag

#   <table >
#   <tr><th>KEY</th><th>VALUE</th></tr>
#   <%= for key <- Map.keys(@o1) do %>
#   <tr><td><button phx-click="KEY" , phx-value-key=<%=key%>>  <%=  "#{key}" %></button></td><td> <%= (inspect @o1[:"#{key}"]) |> String.slice(0..20) %></td></tr>
#   <% end %>
# </table>

# table
# |> tr()
# |> th(key)
# |> th(value)
# |> tr()
# |> td()
# |> td()



end
