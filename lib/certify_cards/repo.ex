defmodule CertifyCards.Repo do
  use Ecto.Repo,
    otp_app: :certify_cards,
    adapter: Ecto.Adapters.Postgres
end
