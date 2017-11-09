defmodule Etbot do
  use Application

  @port Application.get_env(:etbot, :port)
  @token Application.get_env(:etbot, :token)
  @url Application.get_env(:etbot, :url)

  def start(_type, _args) do
    import Supervisor.Spec

    children = [worker(__MODULE__, [], function: :run)]

    opts = [strategy: :one_for_one, name: Etbot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def run do
    {:ok, _} = Plug.Adapters.Cowboy.http Etbot.Router, [], port: @port
  end

  ###################
  # Getting Updates #
  ###################

  defmodule Update do
    defstruct update_id: nil, message: %Etbot.Model.Message{}
  end

  def getUpdates(offset \\ 0, limit \\ 100) do
    query = %{offset: offset, limit: limit}
    HTTPotion.get!(@url <> "getUpdates", query: query) |> response()
  end

  # Ports currently supported for Webhooks: 443, 80, 88, 8443
  def setWebhook(url \\ "") do
     HTTPotion.get!(@url <> "setWebhook", url: url) |> response()
  end

  def deleteWebhook() do
     HTTPotion.get!(@url <> "deleteWebhook") |> response()
  end

  def getWebhookInfo() do
    HTTPotion.get!(@url <> "getWebhookInfo") |> response()
  end

  defmodule WebhookInfo do
    defstruct url: nil, has_custom_certificate: false, pending_update_count: nil
  end

  #####################
  # Available Methods #
  #####################

  def getMe() do
    HTTPotion.get!(@url <> "getMe") |> response()
  end

  def sendMessage(chat_id, text) do
    query = %{chat_id: chat_id, text: text}
    HTTPotion.get!(@url <> "sendMessage", query: query) |> response()
  end

  def forwardMessage(chat_id, from_chat_id, message_id) do
    query = %{chat_id: chat_id, from_chat_id: from_chat_id, message_id: message_id}
    HTTPotion.get!(@url <> "forwardMessage", query: query) |> response()
  end

  # todo: photo is InputFile, WIP
  def sendPhoto(chat_id, photo, caption \\ "") do
    query = %{chat_id: chat_id, photo: photo, caption: caption}
    HTTPotion.get!(@url <> "sendPhoto", query: query) |> response()
  end

  # todo: audio is InputFile, WIP
  def sendAudio(chat_id, audio, caption \\ "") do
    query = %{chat_id: chat_id, audio: audio, caption: caption}
    HTTPotion.get!(@url <> "sendAudio", query: query) |> response()
  end

  # todo: document is InputFile, WIP
  def sendDocument(chat_id, document, caption \\ "") do
    query = %{chat_id: chat_id, document: document, caption: caption}
    HTTPotion.get!(@url <> "sendDocument", query: query) |> response()
  end

  # todo: video is InputFile, WIP
  def sendVideo(chat_id, video, caption \\ "") do
    query = %{chat_id: chat_id, video: video, caption: caption}
    HTTPotion.get!(@url <> "sendVideo", query: query) |> response()
  end

  # todo: voice is InputFile, WIP
  def sendVoice(chat_id, voice, caption \\ "") do
    query = %{chat_id: chat_id, voice: voice, caption: caption}
    HTTPotion.get!(@url <> "sendVoice", query: query) |> response()
  end

  # todo: video_note is InputFile, WIP
  def sendVideoNote(chat_id, video_note, caption \\ "") do
    query = %{chat_id: chat_id, video_note: video_note, caption: caption}
    HTTPotion.get!(@url <> "sendVideoNote", query: query) |> response()
  end

  def sendLocation(chat_id, latitude, longitude) do
    query = %{chat_id: chat_id, latitude: latitude, longitude: longitude}
    HTTPotion.get!(@url <> "sendLocation", query: query) |> response()
  end

  def editMessageLiveLocation(chat_id, message_id, latitude, longitude) do
    query = %{chat_id: chat_id, message_id: message_id, latitude: latitude, longitude: longitude}
    HTTPotion.get!(@url <> "editMessageLiveLocation", query: query) |> response()
  end

  def stopMessageLiveLocation(chat_id, message_id) do
    query = %{chat_id: chat_id, message_id: message_id}
    HTTPotion.get!(@url <> "stopMessageLiveLocation", query: query) |> response()
  end

  def sendVenue(chat_id, latitude, longitude, title, address) do
    query = %{chat_id: chat_id, latitude: latitude, longitude: longitude, title: title, address: address}
    HTTPotion.get!(@url <> "sendVenue", query: query) |> response()
  end

  def sendContact(chat_id, phone_number, first_name) do
    query = %{chat_id: chat_id, phone_number: phone_number, first_name: first_name}
    HTTPotion.get!(@url <> "sendContact", query: query) |> response()
  end

  def sendChatAction(chat_id, action) do
    query = %{chat_id: chat_id, action: action}
    HTTPotion.get!(@url <> "sendChatAction", query: query) |> response()
  end

  def getUserProfilePhotos(user_id) do
    query = %{user_id: user_id}
    HTTPotion.get!(@url <> "getUserProfilePhotos", query: query) |> response()
  end

  def getFile(file_id) do
    query = %{file_id: file_id}
    HTTPotion.get!(@url <> "getFile", query: query) |> response()
  end

  def kickChatMember(chat_id, user_id) do
    query = %{chat_id: chat_id, user_id: user_id}
    HTTPotion.get!(@url <> "kickChatMember", query: query) |> response()
  end

  def unbanChatMember(chat_id, user_id) do
    query = %{chat_id: chat_id, user_id: user_id}
    HTTPotion.get!(@url <> "unbanChatMember", query: query) |> response()
  end

  # WIP
  def restrictChatMember(chat_id, user_id) do
    query = %{chat_id: chat_id, user_id: user_id}
    HTTPotion.get!(@url <> "restrictChatMember", query: query) |> response()
  end

  # WIP
  def promoteChatMember(chat_id, user_id) do
    query = %{chat_id: chat_id, user_id: user_id}
    HTTPotion.get!(@url <> "promoteChatMember", query: query) |> response()
  end

  def exportChatInviteLink(chat_id) do
    query = %{chat_id: chat_id}
    HTTPotion.get!(@url <> "exportChatInviteLink", query: query) |> response()
  end

  # todo: photo is InputFile, WIP
  def setChatPhoto(chat_id, photo) do
    query = %{chat_id: chat_id, photo: photo}
    HTTPotion.get!(@url <> "setChatPhoto", query: query) |> response()
  end

  def deleteChatPhoto(chat_id) do
    query = %{chat_id: chat_id}
    HTTPotion.get!(@url <> "deleteChatPhoto", query: query) |> response()
  end

  def setChatTitle(chat_id, title) do
    query = %{chat_id: chat_id, title: title}
    HTTPotion.get!(@url <> "setChatTitle", query: query) |> response()
  end

  def setChatDescription(chat_id, description) do
    query = %{chat_id: chat_id, description: description}
    HTTPotion.get!(@url <> "setChatDescription", query: query) |> response()
  end

  def pinChatMessage(chat_id, message_id, disable_notification \\ false) do
    query = %{chat_id: chat_id, message_id: message_id, disable_notification: disable_notification}
    HTTPotion.get!(@url <> "pinChatMessage", query: query) |> response()
  end

  def unpinChatMessage(chat_id) do
    query = %{chat_id: chat_id}
    HTTPotion.get!(@url <> "unpinChatMessage", query: query) |> response()
  end

  def leaveChat(chat_id) do
    query = %{chat_id: chat_id}
    HTTPotion.get!(@url <> "leaveChat", query: query) |> response()
  end

  def getChat(chat_id) do
    query = %{chat_id: chat_id}
    HTTPotion.get!(@url <> "getChat", query: query) |> response()
  end

  def getChatAdministrators(chat_id) do
    query = %{chat_id: chat_id}
    HTTPotion.get!(@url <> "getChatAdministrators", query: query) |> response()
  end

  def getChatMembersCount(chat_id) do
    query = %{chat_id: chat_id}
    HTTPotion.get!(@url <> "getChatMembersCount", query: query) |> response()
  end

  def getChatMember(chat_id, user_id) do
    query = %{chat_id: chat_id, user_id: user_id}
    HTTPotion.get!(@url <> "getChatMember", query: query) |> response()
  end

  def setChatStickerSet(chat_id, sticker_set_name) do
    query = %{chat_id: chat_id, sticker_set_name: sticker_set_name}
    HTTPotion.get!(@url <> "setChatStickerSet", query: query) |> response()
  end

  def deleteChatStickerSet(chat_id) do
    query = %{chat_id: chat_id}
    HTTPotion.get!(@url <> "deleteChatStickerSet", query: query) |> response()
  end

  # Answer to inline keyboards, WIP
  def answerCallbackQuery(callback_query_id) do
    query = %{callback_query_id: callback_query_id}
    HTTPotion.get!(@url <> "answerCallbackQuery", query: query) |> response()
  end

  #####################
  # Updating Messages #
  #####################

  def editMessageText(chat_id, message_id, text) do
    query = %{chat_id: chat_id, message_id: message_id, text: text}
    HTTPotion.get!(@url <> "editMessageText", query: query) |> response()
  end

  def editMessageCaption(chat_id, message_id, caption) do
    query = %{chat_id: chat_id, message_id: message_id, caption: caption}
    HTTPotion.get!(@url <> "editMessageCaption", query: query) |> response()
  end

  # todo: reply_markup is InlineKeyboardMarkup, WIP
  def editMessageReplyMarkup(chat_id, message_id, reply_markup) do
    query = %{chat_id: chat_id, message_id: message_id, reply_markup: reply_markup}
    HTTPotion.get!(@url <> "editMessageReplyMarkup", query: query) |> response()
  end

  def deleteMessage(chat_id, message_id) do
    query = %{chat_id: chat_id, message_id: message_id}
    HTTPotion.get!(@url <> "deleteMessage", query: query) |> response()
  end

  ##################
  # Private Helper #
  ##################

  defp response(response) do
     response |> Map.get(:body) |> Poison.decode!(keys: :atoms) |> Map.get(:result)
  end
end
