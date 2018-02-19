defmodule MyappWeb.Router do
  use MyappWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MyappWeb do
    pipe_through :api

    post "/users/auth", UserController, :auth
    resources "/users", UserController, except: [:new, :edit]
    resources "/posts", PostController, except: [:new, :edit]
    get "/newsfeed", PostController, :newsfeed
  end
end
