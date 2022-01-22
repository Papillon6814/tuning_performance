defmodule TuningPerformanceWeb.BlogView do
  use TuningPerformanceWeb, :view

  def render("tags.json", %{tags: tags}) do
    %{
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
