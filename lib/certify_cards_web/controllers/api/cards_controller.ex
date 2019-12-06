defmodule CertifyCardsWeb.CardsController do
  use CertifyCardsWeb, :controller

  alias CertifyCards.Cards
  alias CertifyCards.Cards.Card

  def check(conn, %{"card_code" => card_code}) do
    IO.inspect(card_code)

    with {:ok, %Card{} = card} <- Cards.get_by_code(card_code) do
      json(conn, %{message: "Card with code: #{card_code} belongs to user: #{card.user_code}"})
    else
      _ -> json(conn, %{message: "Card with code: #{card_code}, does not exist"})
    end
  end
end
