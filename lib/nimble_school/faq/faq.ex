defmodule NimbleSchool.Faq do
  alias NimbleSchool.Faq.Question
  use NimblePublisher,
    build: Question,
    from: Application.app_dir(:nimble_school, "priv/faqs/**/*.md"),
    as: :questions,
    highlighters: [:makeup_elixir, :makeup_erlang]
  @questions Enum.sort_by(@questions, & &1.date, {:desc, Date})
  @tags @questions |> Enum.flat_map(& &1.tags) |> Enum.uniq() |> Enum.sort()
  def all_questions, do: @questions
  def all_tags, do: @tags

  defmodule  NotFoundError, do: defexception [:message, plug_status: 404]
  def get_question_by_id!(id) do
    Enum.find(all_questions(), &(&1.id == id)) ||
        raise NotFoundError, "question with id =#{id} not found"
  end

  def get_questions_by_tag!(tag) do
    case Enum.filter(all_questions(), &(tag in &1.tags)) do
      [] -> raise NotFoundError, "questions with tag=#{tag} not found"
      questions -> questions
    end
  end

end
