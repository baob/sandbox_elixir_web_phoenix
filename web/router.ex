defmodule HelloWorld.Router do
  use HelloWorld.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWorld do
    pipe_through :browser # Use the default browser stack

    get "/hello", HelloWorldController, :hello
    get "/hello/:name", HelloWorldController, :hello

    get "/*path", HelloWorldController, :goodbye
    post "/*path", HelloWorldController, :goodbye
    put "/*path", HelloWorldController, :goodbye
    patch "/*path", HelloWorldController, :goodbye
    delete "/*path", HelloWorldController, :goodbye
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWorld do
  #   pipe_through :api
  # end
end
