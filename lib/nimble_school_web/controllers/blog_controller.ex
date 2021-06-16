defmodule NimbleSchoolWeb.BlogController do
  use NimbleSchoolWeb, :controller
  alias NimbleSchool.Blog

  def index(conn, _params) do
    render(conn, "index.html", posts: Blog.all_posts())
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", post: Blog.get_post_by_id!(id))
  end

  def indexByTag(conn, %{"tag" => tag}) do
    # ここから
    render(conn, "indexByTag.html", posts: Blog.get_post_by_id!(tag))
  end
end
