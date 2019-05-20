# CockroachDB Ecto Adaptor

This is a very small fork of the official Postgresql Adaptor bundled with `ecto_sql`.

The main reason for this fork is Ecto 3.x no longer keeps microseconds information for `:time`, `:naive_datetime` and `:utc_datetime`.

The net effect is it uses timestamp(0) when creating fields with such types and the migration table used by Ecto is using one of those types.

The problem is CockroachDB does not support timestamp with precision unless it's the default precision (6).

This adaptor use the default precision for those types.
It also disable the migration lock given locking is not supported by CockroachDB either.

For more information, check the [github issue](https://github.com/cockroachdb/cockroach/issues/32098)
## Installation

The package can be installed
by adding `ecto_cockroachdb` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ecto_cockroachdb, "~> 1.0.0"}
  ]
end
```

## Usage

```elixir
# In your application code
defmodule Sample.Repo do
  use Ecto.Repo,
    otp_app: :my_app,
    adapter: Ecto.Adapters.CockroachDB
end
```
