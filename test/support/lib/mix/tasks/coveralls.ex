defmodule Mix.Tasks.Coveralls.SafeTravis do
  @moduledoc false

  use Mix.Task

  @preferred_cli_env :test
  @shortdoc "A safe `coveralls.travis` variant that doesn't crash on failed upload."

  def run(args) do
    Mix.Tasks.Coveralls.do_run(args, type: "travis")
  rescue
    e in ExCoveralls.ReportUploadError ->
      Mix.shell().error("Failed coveralls upload: #{Exception.message(e)}")
  end
end
