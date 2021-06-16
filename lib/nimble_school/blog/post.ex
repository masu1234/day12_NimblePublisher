defmodule NimbleSchool.Blog.Post do
  @enforce_keys [:id, :author, :title, :body, :description, :tags, :date]
  defstruct [:id, :author, :title, :body, :description, :tags, :date]

  def build(filename, attrs, body) do
    [year, month_day_id] = filename |> Path.rootname() |> Path.split() |> Enum.take()
  end
end
