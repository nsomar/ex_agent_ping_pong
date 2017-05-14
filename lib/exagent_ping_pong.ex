use ExAgent

defagent ExAgentPingAgent do
  message(:inform, Sender, ping) do
    &print("PING")
    &send(Sender, :inform, pong)
  end
end

defagent ExAgentPongAgent do
  message(:inform, Sender, pong) do
    &print("PONG")
    &send(Sender, :inform, ping)
  end

  initialize do
    &send(ExAgentPingAgent.agent_name("ag1"), :inform, ping)
  end
end