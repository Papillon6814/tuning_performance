defmodule TuningPerformance.Repo do
  use Ecto.Repo,
    otp_app: :tuning_performance,
    adapter: Ecto.Adapters.Postgres
end
