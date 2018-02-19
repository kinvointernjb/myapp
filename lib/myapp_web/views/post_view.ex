defmodule MyappWeb.PostView do
  use MyappWeb, :view
  alias MyappWeb.{UserView, PostView}

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{
      id: post.id,
      title: post.title,
      content: post.content,
      user: render_one(post.user, UserView, "user.json")
    }
  end

  def render("post_without_user.json", %{post: post}) do
    %{
      id: post.id,
      title: post.title,
      content: post.content  
    }
  end
end
