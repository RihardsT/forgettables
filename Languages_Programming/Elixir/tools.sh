Mix - build tool
Hex - Package manager

docker run --rm -ti -v $PWD:/tmp -w /tmp elixir:slim bash
mix --help

### Start an application
mix new hello_world --sup # with supervisor
mix test

### Supervisors
Will check our app and restart it if it crashes
### Umbrella App
Application that has multiple applications under it.
Group multiple applications.


### Hex
https://hex.pm

# Add package in mix.exs
defp deps do
  [{:credo, "~> 0.8.7"}]
end

# Fetch dependencies
mix deps.get