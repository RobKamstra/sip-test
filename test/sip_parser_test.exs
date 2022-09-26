defmodule SIPParserTest do
  use ExUnit.Case

  @sip_message File.read!("priv/SIP_INVITE.txt")

  test "can parse a SIP INVITE" do
    {result, message} = SIPParser.parse(@sip_message)

    assert result == :ok
    refute message.start_line == nil
    refute message.headers == nil
    refute message.body == nil
  end

  test "can get userpart of the request uri" do
    {:ok, message} = SIPParser.parse(@sip_message)
    request_user = SIPParser.get_request_user(message)

    assert request_user == "bob"
  end

  test "SIP INFO method is allowed" do
    {:ok, message} = SIPParser.parse(@sip_message)
    allowed = SIPParser.allowed?(message, "INFO")

    assert is_boolean(allowed)
    assert allowed
  end

  test "SIP UPDATE method is not allowed" do
    {:ok, message} = SIPParser.parse(@sip_message)
    allowed = SIPParser.allowed?(message, "UPDATE")

    assert is_boolean(allowed)
    refute allowed
  end
end
