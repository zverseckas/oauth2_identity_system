FROM elixir:latest
MAINTAINER Zilvinas Verseckas <zverseckas@gmail.com>
RUN mix local.hex --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez
RUN mix local.rebar --force
WORKDIR /app
