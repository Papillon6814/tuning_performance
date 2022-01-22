defmodule TuningPerformance.Blog do
  import Ecto.Query
  alias TuningPerformance.Repo

  alias TuningPerformance.Blog.{
    Post,
    Tag
  }

  @doc """
  Create post
  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Create Tag
  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Get post
  """
  def get_post(post_id) do
    Post
    |> where([p], p.id == ^post_id)
    |> Repo.one()
  end

  @doc """
  Load post
  """
  def load_post(post_id) do
    Post
    |> where([p], p.id == ^post_id)
    |> Repo.one()
    |> Repo.preload(:tags)
  end

  @doc """
  Get tags by post id
  """
  def get_tags_by_post_id(post_id) do
    Tag
    |> where([t], t.post_id == ^post_id)
    |> Repo.all()
  end
end
