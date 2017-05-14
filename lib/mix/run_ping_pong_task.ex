defmodule Mix.Tasks.RunAgent do
  use Mix.Task

  def run(_) do
    ExAgent.start_agent(ExAgentPingAgent, "ag1")
    ExAgent.start_agent(ExAgentPongAgent, "ag1")
    Process.sleep(1000)
  end
end