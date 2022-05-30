defmodule BetApiWeb.PageController do
  use BetApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
