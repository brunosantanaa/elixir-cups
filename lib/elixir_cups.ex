defmodule ElixirCups do
  @moduledoc """
  Documentation for ElixirCups.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirCups.hello()
      :world

  """

  def start_link(conf \\ []) do
    GenServer.start_link(__MODULE__, conf, name: __MODULE__)
  end

  def init(_conf) do
    {:ok, %{printer: ""}}
  end

  def list_printers(), do: GenServer.call(__MODULE__, :list)
  def sel_printer(printer), do: GenServer.cast(__MODULE__, {:printer, printer})
  def print(file), do: GenServer.cast(__MODULE__, {:print, file})
  def add_printer(name, ip \\ ""), do: GenServer.cast(__MODULE__, {:add, name, ip})
  
  def handle_cast({:printer, printer}, state) do
    {:noreply, %{state | :printer => printer}}  
  end

  def handle_cast({:print, file}, state) do
    System.cmd("lp", ["-d", state.printer, "-o", "document-format=text/html", file])
    {:noreply, state}
  end

  def handle_cast({:add, name, ip}, state) do
    System.cmd("lpadmin", ["-p", name, "-E", "-v", "ipp://#{ip}/ipp/print", "-m", "everywhere"])
    {:noreply, state}
  end

  def handle_call(:list, _from, state) do
    {:reply, System.cmd("lpstat", ["-a"]) 
    |> elem(0) 
    |> String.split("\n") 
    |> List.delete("") 
    |> Enum.map(fn x -> String.split(x, " ") |> hd() end), state}
  end
end
