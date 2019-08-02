defmodule KV.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  @bucket_supervisor KV.Bucket.Supervisor
  @bucket_registry KV.Registry

  def init(:ok) do
    children = [
      supervisor(KV.Bucket.Supervisor, [[name: @bucket_supervisor]]),
      worker(KV.Registry, [@bucket_supervisor, [name: @bucket_registry]])
    ]
    supervise(children, strategy: :one_for_one)
  end
end
