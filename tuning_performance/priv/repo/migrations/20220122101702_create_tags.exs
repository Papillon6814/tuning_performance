defmodule TuningPerformance.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :name, :string
      add :post_id, references(:blog_posts, on_delete: :nothing)

      timestamps()
    end

    create index(:tags, [:post_id])
  end
end
