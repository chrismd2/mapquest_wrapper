defmodule MapquestWrapper.GeoCoder do
  @moduledoc false

  @uri "https://www.mapquestapi.com"

  def geocode_address(location) do
    request = %HTTPoison.Request{
      method: :get,
      url: "#{@uri}/geocoding/v1/address?location=#{URI.encode(location)}&key=#{System.get_env("MAP_QUEST_KEY")}",
      options: [],
      headers: [
        {~s|Content-Type|, ~s|application/json|},
        ],
      params: [],
      body: ""
    }

    {:ok, %HTTPoison.Response{body: body, status_code: status_code}} = HTTPoison.request(request)
    if status_code < 300 do
      %{"results" => results} = Jason.decode!(body)
      results
    else
      body
    end
  end

  def reverse_geocode(%{latitude: latitude, longitude: longitude}) do
    request = %HTTPoison.Request{
      method: :get,
      url: "#{@uri}/geocoding/v1/reverse?location=#{latitude},#{longitude}&key=#{System.get_env("MAP_QUEST_KEY")}",
      options: [],
      headers: [
        {~s|Content-Type|, ~s|application/json|},
        ],
      params: [],
      body: ""
    }

    {:ok, %HTTPoison.Response{body: body, status_code: status_code}} = HTTPoison.request(request)
    if status_code < 300 do
      %{"results" => results} = Jason.decode!(body)
      results
    else
      body
    end
  end
end
