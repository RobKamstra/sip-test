defmodule SIPParser do
  @moduledoc """
  The SIPParses module takes a SIP request and parses it to a native data structure and can do
  basic operations on the SIP message.
  """
  @type t :: %__MODULE__{
          headers: term(),
          body: binary(),
          start_line: term()
        }
  defstruct [:headers, :body, :start_line]

  @doc """
  Parses a raw SIP request to the internal representation.
  """
  @spec parse(binary()) :: {:ok, t} | {:error, term()}
  def parse(_sip_message) do
    {:ok, %__MODULE__{}}
  end

  @doc """
  Gets the userpart from the URI which is present in the Request-Line. The Request-Line is the
  first line of the SIP request.
  """
  @spec get_request_user(t) :: binary()
  def get_request_user(_parsed_sip_message) do
    "user"
  end

  @doc """
  Confirms if a certain SIP method is allowed or not for this User-Agent. This is signalled by the
  User-Agent in the `Allow`-header.
  """
  @spec allowed?(t, binary()) :: boolean()
  def allowed?(_parsed_sip_message, _method) do
    false
  end
end
