require "kemal"
require "../models/*"
require "json"
require "../dto/*"

sockets = [] of HTTP::WebSocket

public_folder "src/assets"

get "/" do
  render "src/views/chat.ecr"
end

ws "/" do |socket|
  
  sockets << socket

  record = Message.all.relation(:users).select { [User._name, User._surname, _text] }.results.to_a

  all = Array(MessageDTO).new
  record.each do |r|
    message = MessageDTO.new(r.name.to_s, r.surname.to_s, r.text.to_s)
    all << message
  end

  socket.send all.to_json

  socket.on_message do |message|
    Message.create(text: message.to_s, user_id: 1, community_group_id: 1)

    r_record = Message.all.relation(:users).select { [User._name, User._surname, _text] }.results.to_a
    r_all = Array(MessageDTO).new
    r_record.each do |r|
      message = MessageDTO.new(r.name.to_s, r.surname.to_s, r.text.to_s)
      r_all << message
    end

    sockets.each do |a_socket|
      a_socket.send r_all.to_json
    end
  end

  # Remove clients from the list when it's closed
  socket.on_close do
    sockets.delete socket
  end

end

#get "/" do
#  Role.create(name: "Student")
#  me = User.all.where { _name == "Olha" }.to_a[0]
#  RolesUsers.create(user_id: me.id, role_id: 1)
#r = User.all.relation(:roles).where { Role._name == "Student" }.to_a[0]
#User.create(name: "Olha", surname: "Yurieva", yearOfStudy: 4, birthday: Time.utc(2016, 2, 15, 10, 20, 30), faculty: "FI")
#User.create(name: "Sasha", surname: "Radzievska", yearOfStudy: 4, birthday: Time.utc(2016, 2, 15, 10, 20, 30), faculty: "FI")

 # me = User.all.where { _name == "Olha" }.to_a[0]
 #sasha = User.all.where {_name == "Sasha" }.to_a[0]
 #Message.create(text: "Hello world", to_user: 1, from_user: 2)
#"Hello"

 # name = me.name

 #CommunityGroup.create(name: "Time working", users: [1])
# me = CommunityGroup.all.where { _id == 1 }.to_a[0]
# user = User.all.first
#me.users = Array{user.not_nil!.id}
#me.save
# role = user.not_nil!.messages.to_a[0].text
 #me.users.create(Array{user})
#message = Message.all.first
#user.not_nil!.messages.created()# = Array{message}
#user.save
#u = User.build({:name => "Test", :surname => "Test", :yearOfStudy => 4, :birthday => Time.utc(2016, 2, 15, 10, 20, 30), :faculty => "FI",:roles => Array{role} })
#u.save
#user.not_nil!.roles.create(name: "Test")
#user.not_nil!.add_messages({ :role_id => 1, :name => "Student" })

 #render "src/views/home.ecr", "src/views/main_layout.ecr"
#end

get "/login" do
#  User.create(name: "Olha", surname: "Yurieva", email: "yurieva.olga99@gmail.com", password_digest: "p",
#    yearOfStudy: 4, birthday: Time.utc(2016, 2, 15, 10, 20, 30), faculty: "FI")
#  Message.create(text: "Hello world", user_id: 1)
#  User.all.first.not_nil!.messages
  render "src/views/login.ecr"
end

get "/registration" do
  render "src/views/registration.ecr"
end
