defmodule TuningPerformanceWeb.BlogView do
  use TuningPerformanceWeb, :view

  def render("post.json", %{post: post}) do
    %{
      result: true,
      id: post.id,
      title: post.title,
      views: post.views,
    }
  end

  def render("post_preload.json", %{post: post}) do
    %{
      result: true,
      length: length(post.tags),
      id: post.id,
      title: post.title,
      views: post.views,
      tags: Enum.map(post.tags, fn tag ->
        %{
          id: tag.id,
          name: tag.name
        }
      end)
    }
  end

  def render("tags.json", %{tags: tags}) do
    %{
      result: true,
      length: length(tags),
      data: Enum.map(tags, fn tag ->
        %{
          id: tag.id,
          name: tag.name
        }
      end)
    }
  end
end
