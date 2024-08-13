defmodule MapquestWrapper do
  @moduledoc """
  A wrapper for MapQuest API.
  """

  alias MapquestWrapper.GeoCoder

  @doc """
  Use address data to run geocode.

  ## Examples

      iex> MapquestWrapper.geocode_address("99599")[
      %{
        "locations" => [
          %{
            "adminArea1" => "US",
            "adminArea1Type" => "Country",
            "adminArea3" => "AK",
            "adminArea3Type" => "State",
            "adminArea4" => "Anchorage",
            "adminArea4Type" => "County",
            "adminArea5" => "Anchorage",
            "adminArea5Type" => "City",
            "adminArea6" => "Midtown",
            "adminArea6Type" => "Neighborhood",
            "displayLatLng" => %{"lat" => 61.18644, "lng" => -149.88056},
            "dragPoint" => false,
            "geocodeQuality" => "ZIP_EXTENDED",
            "geocodeQualityCode" => "Z3AAA",
            "latLng" => %{"lat" => 61.18644, "lng" => -149.88056},
            "linkId" => "0",
            "mapUrl" => "",
            "postalCode" => "99599",
            "sideOfStreet" => "N",
            "street" => "",
            "type" => "s",
            "unknownInput" => ""
          }
        ],
        "providedLocation" => %{"location" => "99599"}
      }
    ]
  """
  def geocode_address(location) do
    GeoCoder.geocode_address(location)
  end

  @doc """
  Use latlong to reverse geocode.

  ## Examples

      iex> MapquestWrapper.reverse_geocode(%{longitude: -45.64005, latitude: 123.12024})
      [
        %{
          "locations" => [
            %{
              "displayLatLng" => %{"lat" => 123.12024, "lng" => -45.64005},
              "dragPoint" => false,
              "geocodeQuality" => "ADDRESS",
              "geocodeQualityCode" => "L1AAA",
              "latLng" => %{"lat" => 123.12024, "lng" => -45.6404},
              "linkId" => "0",
              "mapUrl" => "",
              "postalCode" => "99599-9999",
              "sideOfStreet" => "R",
              "street" => "678 nein street",
              "type" => "s",
              "unknownInput" => ""
            }
          ],
          "providedLocation" => %{
            "latLng" => %{"lat" => 123.12024, "lng" => -45.64005}
          }
        }
      ]
  """
  def reverse_geocode(location) do
    GeoCoder.reverse_geocode(location)
  end
end
