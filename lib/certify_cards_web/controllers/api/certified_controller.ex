defmodule CertifyCardsWeb.CertifiedController do
  use CertifyCardsWeb, :controller

  alias CertifyCards.{Cards, Devices}
  alias CertifyCards.Cards.Card
  alias CertifyCards.Devices.Device

  @client_id Application.get_env(:certify_cards, :client_id, "no-client")
  @client_secret Application.get_env(:certify_cards, :client_secret, "no-client")
  @base_url "https://enabling.io"

  def validate(conn, %{"deviceId" => device_code, "cardId" => card_code}) do
    with {:ok, %Card{user_code: user_code}} <- Cards.get_by_code(card_code),
         {:ok, %Device{certificate_code: certificate_code}} <- Devices.get_by_code(device_code),
         {:ok, status} <- get_status(certificate_code, user_code) do
      if(status["compliant"]) do
        json(conn, %{message: "certified"})
      else
        json(conn, %{message: "not certified"})
      end
    else
      {:error, :not_found} -> json(conn, %{message: "not certified"})
      error -> json(conn, %{message: "not found"})
    end
  end

  def validate(conn, params) do
    IO.inspect(params)
    json(conn, %{})
  end

  defp get_access_token do
    url =
      "#{@base_url}/oauth2/token?client_id=#{@client_id}&client_secret=#{@client_secret}&grant_type=client_credentials"

    {:ok, %{body: body}} = HTTPoison.post(url, [], [])

    body
    |> Poison.decode!()
    |> Map.fetch!("access_token")
  end

  defp get_status(certificate_code, user_code) do
    headers = [
      Authorization: "Bearer #{get_access_token()}",
      Accept: "Application/json; Charset=utf-8"
    ]

    with {:ok, %{body: body}} <-
           HTTPoison.get(
             "#{@base_url}/api/v1/compliance_status?certificate_code=#{certificate_code}&user_code=#{
               user_code
             }",
             headers,
             []
           ) do
      if(body == "Not found") do
        {:error, :not_found}
      else
        body
        |> Poison.decode!()
        |> Map.fetch("compliance_status")
      end
    end
  end
end
