defmodule TuningPerformanceWeb.PageController do
  use TuningPerformanceWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
