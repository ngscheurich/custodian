use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :custodian, CustodianWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :custodian, Custodian.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "custodian_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure Github API private key
config :custodian, :github_key, {:file, "test/support/github_key.pem"}

# Configures app's GitHub API client
config :custodian, :github_api, Custodian.Github.Mockcat

# Configures app's task processor
config :custodian, :processor, Custodian.Tasks.Sync

# Configure CI test formatter
if System.get_env("CI") do
  config :junit_formatter,
    report_dir: "#{Path.expand(System.get_env("CIRCLE_WORKING_DIRECTORY"))}/reports",
    print_report_file: true
end
