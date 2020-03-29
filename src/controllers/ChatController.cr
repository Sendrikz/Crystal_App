require "kemal"
require "kemal-session"
require "../models/*"
require "json"
require "../dto/*"

sockets = [] of HTTP::WebSocket

public_folder "src/assets"

ws "/" do |socket, context|

  sockets << socket

  group = context.session.object("group")
  user = context.session.object("user")

  all_messages_from_group = Message.getAllMessagesByGroup(group)

  socket.send all_messages_from_group.to_json

  socket.on_message do |message|
    Message.create(text: message.to_s, user_id: user.id.not_nil!.to_i, community_group_id: group.id.not_nil!.to_i)
    all_messages_from_group = Message.getAllMessagesByGroup(group)

    sockets.each do |a_socket|
      a_socket.send all_messages_from_group.to_json
    end
  end

  socket.on_close do
    sockets.delete socket
  end

end
