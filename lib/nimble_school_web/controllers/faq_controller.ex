defmodule NimbleSchoolWeb.FaqController do
  use NimbleSchoolWeb, :controller
  alias NimbleSchool.Faq

  def index(conn, _params) do
    render(conn, "index.html", questions: Enum.take(Faq.all_questions(),2))
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", question: Faq.get_question_by_id!(id))
  end
end
