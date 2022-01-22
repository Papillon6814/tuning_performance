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

  def get_post(conn, %{"post_id" => post_id}) do
    post = Blog.get_post(post_id)

    render(conn, "post.json", post: post)
  end

  def load_post(conn, %{"post_id" => post_id}) do
    post = Blog.load_post(post_id)

    render(conn, "post_preload.json", post: post)
  end

  def get_tags(conn, %{"post_id" => post_id}) do
    tags = Blog.get_tags_by_post_id(post_id)

    render(conn, "tags.json", tags: tags)
  end
end
