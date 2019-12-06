defmodule CertifyCardsWeb.PageController do
  use CertifyCardsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
