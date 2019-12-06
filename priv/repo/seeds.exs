# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CertifyCards.Repo.insert!(%CertifyCards.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

CertifyCards.Repo.insert_all(CertifyCards.Devices.Device, [
  %{
    certificate_code: "comp",
    code: "917293874912374",
    inserted_at: NaiveDateTime.utc_now(),
    updated_at: NaiveDateTime.utc_now()
  }
])

CertifyCards.Repo.insert_all(CertifyCards.Cards.Card, [
  %{
    user_code: "FYI",
    code: "19816639131196",
    inserted_at: NaiveDateTime.utc_now(),
    updated_at: NaiveDateTime.utc_now()
  },
  %{
    user_code: "OGG",
    code: "14514847475",
    inserted_at: NaiveDateTime.utc_now(),
    updated_at: NaiveDateTime.utc_now()
  }
])
