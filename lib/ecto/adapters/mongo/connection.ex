if Code.ensure_loaded?(Mongo) do
  defmodule Ecto.Adapters.Mongo.Connection do
    @moduledoc false

    @behaviour Ecto.Adapters.SQL.Connection

    ## Module and Options

    @impl true
    def child_spec(opts) do
      Mongo.child_spec(opts)
    end

    @impl true
    def to_constraints(_exception) do
      raise("not implemented")
    end

    ## Query

    @impl true
    def prepare_execute(_conn, _name, _sql, _params, _opts) do
      raise "not implemented"
    end

    @impl true
    def query(_conn, _sql, _params, _opts) do
      raise "not implemented"
    end

    @impl true
    def execute(_conn, %{ref: _ref} = _query, _params, _opts) do
      raise "not implemented"
    end

    @impl true
    def stream(_conn, _sql, _params, _opts) do
      raise "not implemented"
    end

    @impl true
    def all(_query) do
      raise "not implemented"
    end

    @impl true
    def update_all(_query, _prefix \\ nil) do
      raise "not implemented"
    end

    @impl true
    def delete_all(%{from: _from} = _query) do
      raise "not implemented"
    end

    @impl true
    def insert(_prefix, _table, _header, _rows, _on_conflict, _returning) do
      raise "not implemented"
    end

    @impl true
    def update(_prefix, _table, _fields, _filters, _returning) do
      raise "not implemented"
    end

    @impl true
    def delete(_prefix, _table, _filters, _returning) do
      raise "not implemented"
    end

    # DDL

    @impl true
    def execute_ddl(string) when is_binary(string) do
      error!(nil, "MongoDB adapter does not support raw SQL statements")
    end

    def execute_ddl(keyword) when is_list(keyword) do
      error!(nil, "MongoDB adapter does not support keyword lists in execute")
    end

    def execute_ddl({command, _entity, _columns})
        when command in [:create_if_not_exists, :drop_if_exists] do
      error!(nil, "MongoDB adapter does not support `#{command}`")
    end

    @impl true
    def ddl_logs(_result) do
      raise "not implemented"
    end

    @impl true
    def table_exists_query(_table) do
      raise "not implemented"
    end

    ## Helpers

    defp error!(nil, message) do
      raise ArgumentError, message
    end

    defp error!(query, message) do
      raise Ecto.QueryError, query: query, message: message
    end
  end
end
