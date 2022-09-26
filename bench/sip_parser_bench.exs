defmodule SIPParserBench do
  @moduledoc """
  Simple benchmarking the SIP message parser
  """
  @sip_message File.read!("priv/SIP_INVITE.txt")

  Benchee.run(
    %{
      "parser" => fn -> SIPParser.parse(@sip_message) end
    },
    memory_time: 2
  )
end
