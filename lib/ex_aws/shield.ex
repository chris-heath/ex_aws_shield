defmodule ExAws.Shield do
  @moduledoc """
  Documentation for `ExAws.Shield`.
  """

  import ExAws.Utils

  @version "2016-06-16"

  @type list_protections_opts :: [
    next_token: binary,
    max_results: integer
  ]
  @spec list_protections() :: ExAws.Operation.JSON.t()
  @spec list_protections(opts :: list_protections_opts) :: ExAws.Operation.JSON.t()
  def list_protections(opts \\ []) do
    query_params =
      opts
      |> normalize_opts()

    request(:list_protections, query_params)
  end

  ####################
  # Helper Functions #
  ####################
  defp request(action, data) do
    operation = action |> Atom.to_string() |> Macro.camelize()

    ExAws.Operation.JSON.new(
      :shield,
      %{
        data: data,
        headers: [
          {"x-amz-target", "AWSShield_#{format_version()}.#{operation}"},
          {"content-type", "application/x-amz-json-1.1"}
        ]
      }
    )
  end

  defp format_version(), do: String.replace(@version, "-", "")

  defp normalize_opts(opts) do
    opts
    |> Enum.into(%{})
    |> camelize_keys
  end
end
