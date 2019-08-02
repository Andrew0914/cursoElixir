defmodule KV.Bucket do

  def start_link do
    Agent.start_link fn -> Map.new end
  end

  def get(bucket, key) do
    Agent.get bucket, &Map.get(&1,key)
  end

  def put(bucket, key, value) do
    Agent.update bucket, &Map.put(&1, key, value)
  end

  def delete(bucket, key) do
    Agent.get_and_update bucket, &Map.pop(&1, key)
  end
end
