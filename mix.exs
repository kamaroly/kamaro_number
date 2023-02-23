defmodule KamaroNumber.MixProject do
  use Mix.Project

  def project do
    [
      app: :kamaro_number,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      source_url: "https://github.com/kamaroly/kamaro_number"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    []
  end

  defp description() do
    "A minimal package to convert numbers into Words such as one hundred twenty three point thirty seven instead of 123.37."
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "kamaro_number",
      # These are the default files included in the package
      files: ~w(lib test .formatter.exs mix.exs README*),
      licenses: ["MIT License"],
      links: %{"GitHub" => "https://github.com/kamaroly/kamaro_number"}
    ]
  end
end
