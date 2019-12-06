defmodule CertifyCardsWeb.Router do
  use CertifyCardsWeb, :router

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

  scope "/", CertifyCardsWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", CertifyCardsWeb do
    pipe_through :api

    get "/check", CardsController, :check
    post "/validate", CertifiedController, :validate
  end
end
