require "kemal"
require "../models/*"
require "json"

messages = [] of String
sockets = [] of HTTP::WebSocket

public_folder "src/assets"

get "/" do
  render "src/views/chat.ecr"
end

ws "/" do |socket|
  sockets.push socket
  
  socket.send Message.all.to_a.to_json


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
