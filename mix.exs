defmodule SIPParser.MixProject do
  use Mix.Project

  def project do
    [
      app: :sip_parser,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp deps() do
    [benchee: "~> 1.0"]
  end
end
