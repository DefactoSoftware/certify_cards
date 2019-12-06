defmodule CertifyCards.Cards.Card do
  use Ecto.Schema

  alias __MODULE__

  @primary_key {:id, :binary_id, autogenerate: true}
  @timestamps_opts [type: :naive_datetime_usec]

  schema "cards" do
    field(:user_code, :string)
    field(:code, :string)

    timestamps()
  end
end
