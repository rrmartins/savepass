defmodule Savepass.PageController do
  use Savepass.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
