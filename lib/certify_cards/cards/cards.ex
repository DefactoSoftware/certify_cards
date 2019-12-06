defmodule CertifyCards.Cards do
  alias CertifyCards.Repo
  alias CertifyCards.Cards.Card

  def get_by_code(code) do
    {:ok, Repo.get_by(Card, code: code)}
  end
end
