# Etbot

Elixir Telegram Bot wrapper using Elixir

## Installation

Add Etbot to your `mix.exs` dependencies

```elixir
def deps do
  [{:etbot, "~> 0.0.1", git: "https://github.com/ericivander/etbot.git"}]
end
```

Then get dependencies

```sh-session
$ mix deps.get
```

## Configuration

Add your Telegram Bot API token to `config/config.exs`

```elixir
config :etbot,
  token: "put_token_here"
```

## Usage

```elixir
Etbot.getMe()
#=> %{first_name: "Elixir Telegram Bot", id: <>, is_bot: true, username: <>}

Etbot.getUpdates()
#=> [%{message: %{chat: %{first_name: "Eric Ivander", id: <>,
#=>       last_name: "Jeadi", type: "private", username: "ericivander"},
#=>     date: <>, entities: [%{length: 6, offset: 0, type: "bot_command"}],
#=>     from: %{first_name: "Eric Ivander", id: 1, is_bot: false,
#=>       last_name: "Jeadi", username: "ericivander"}, message_id: 1,
#=>     text: "/start"}, update_id: x},
#=> %{message: %{chat: %{first_name: "Eric Ivander", id: <>,
#=>       last_name: "Jeadi", type: "private", username: "ericivander"},
#=>     date: <>,
#=>     from: %{first_name: "Eric Ivander", id: <>, is_bot: false,
#=>       language_code: "en-US", last_name: "Jeadi", username: "ericivander"},
#=>     message_id: 2, text: "first message"}, update_id: <>},
#=> %{message: %{chat: %{first_name: "Eric Ivander", id: <>,
#=>       last_name: "Jeadi", type: "private", username: "ericivander"},
#=>     date: <>,
#=>     from: %{first_name: "Eric Ivander", id: <>, is_bot: false,
#=>       language_code: "en-US", last_name: "Jeadi", username: "ericivander"},
#=>     message_id: 3, text: "second message"}, update_id: <>}]
```

Field `id`, `username`, `date`, and `update_id` are omitted.

## Progress

### Telegram API

- [X] Getting updates
- [X] Available types
- [X] Available methods
- [X] Updating messages
- [ ] Stickers
- [ ] Inline Mode
- [ ] Payments
- [ ] Games

### Format response

- [ ] Map response to model

### Fix config

- [ ] Remove config, set to mix-able
