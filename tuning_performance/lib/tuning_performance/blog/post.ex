defmodule TuningPerformance.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias TuningPerformance.Blog.Tag

  schema "blog_posts" do
    field :title, :string
    field :views, :integer

    has_many :tags, Tag

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :views])
    |> validate_required([:title, :views])
  end
end
