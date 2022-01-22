defmodule TuningPerformanceWeb.BlogController do
  use TuningPerformanceWeb, :controller

  alias TuningPerformance.Blog

  def create_post(conn, params) do
    params
    |> Blog.create_post()
    |> case do
      {:ok, _} -> json(conn, %{result: true})
      _        -> json(conn, %{result: false})
    end
  end

  def create_tag(conn, params) do
    params
    |> Blog.create_tag()
    |> case do
      {:ok, _} -> json(conn, %{result: true})
      _        -> json(conn, %{result: false})
    end
  end
end
