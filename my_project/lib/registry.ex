defmodule KV.Registry do
  use GenServer

  # Client API

  def start_link(bucket_supervisor, opts \\ []) do
    GenServer.start_link __MODULE__, {:ok, bucket_supervisor}, opts
  end

  def lookup(server, name) do
    GenServer.call server, {:lookup, name}
  end

  def create(server, name) do
    GenServer.cast server, {:create, name}
  end

  # Server Callbacks

  def init({:ok, bucket_supervisor}) do
    {:ok, %{bucket_supervisor: bucket_supervisor, buckets: %{}}}
  end

  def handle_call({:lookup, name}, _from, state) do
    {:reply, Map.get(state.buckets, name), state}
  end

  def handle_cast({:create, name}, state) do
    if Map.has_key?(state.buckets, name) do
      {:noreply, state}
    else
      {:ok, bucket} = KV.Bucket.Supervisor.start_bucket state.bucket_supervisor
      {:noreply, Map.put(state, :buckets, Map.put(state.buckets, name, bucket))}
    end
  end
end
