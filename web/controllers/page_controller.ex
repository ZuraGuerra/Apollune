defmodule Ararea.PageController do
  use Ararea.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
