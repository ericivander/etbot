defmodule Etbot.Model do
  # https://core.telegram.org/bots/api#available-types
  # Optional fields are omitted

  ###################
  # Available Types #
  ###################

  defmodule User do
    defstruct id: nil, is_bot: false, first_name: nil
  end

  defmodule Chat do
    defstruct id: nil, type: nil
  end

  defmodule Message do
    defstruct message_id: nil, date: nil, chat: %Chat{}
  end

  defmodule MessageEntity do
    defstruct type: nil, offset: nil, limit: nil
  end

  defmodule PhotoSize do
    defstruct file_id: nil, width: nil, height: nil
  end

  defmodule Audio do
    defstruct file_id: nil, duration: nil
  end

  defmodule Document do
    defstruct file_id: nil
  end

  defmodule Video do
    defstruct file_id: nil, width: nil, height: nil, duration: nil
  end

  defmodule Voice do
    defstruct file_id: nil, duration: nil
  end

  defmodule VideoNote do
    defstruct file_id: nil, length: nil, duration: nil
  end

  defmodule Contact do
    defstruct phone_number: nil, first_name: nil
  end

  defmodule Location do
    defstruct longitude: nil, latitude: nil
  end

  defmodule Venue do
    defstruct location: %Location{}, title: nil, address: nil
  end

  defmodule UserProfilePhotos do
    defstruct total_count: nil, photos: nil # photos is array of %PhotoSize{}
  end

  defmodule File do
    defstruct file_id: nil
  end

  defmodule ReplyKeyboardMarkup do
    defstruct keyboard: nil # keyboard is array of %KeyboardButton{}
  end

  defmodule KeyboardButton do
    defstruct text: nil
  end

  defmodule ReplyKeyboardRemove do
    defstruct remove_keyboard: true
  end

  defmodule InlineKeyboardMarkup do
    defstruct inline_keyboard: nil # inline_keyboard is array of %InlineKeyboardButton{}
  end

  defmodule InlineKeyboardButton do
    defstruct text: nil
  end

  defmodule CallbackQuery do
    defstruct id: nil, from: %User{}
  end

  defmodule ForceReply do
    defstruct force_reply: true
  end

  defmodule ChatPhoto do
    defstruct small_file_id: nil, big_file_id: nil
  end

  defmodule ChatMember do
    defstruct user: %User{}, status: nil
  end

  defmodule ResponseParameters do
    defstruct []
  end
end
