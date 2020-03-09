require "kemal"
require "../models/*"

get "/" do
  Role.create(name: "Student")
  me = User.all.where { _name == "Olha" }.to_a[0]
  RolesUsers.create(user_id: me.id, role_id: 1)
r = User.all.relation(:roles).where { Role._name == "Student" }.to_a[0]
User.create(name: "Olha", surname: "Yurieva", yearOfStudy: 4, birthday: Time.utc(2016, 2, 15, 10, 20, 30), faculty: "FI")
User.create(name: "Sasha", surname: "Radzievska", yearOfStudy: 4, birthday: Time.utc(2016, 2, 15, 10, 20, 30), faculty: "FI")

 me = User.all.where { _name == "Olha" }.to_a[0]
 sasha = User.all.where {_name == "Sasha" }.to_a[0]
 Message.create(text: "Hello world", to_user: 1, from_user: 2)
"Hello"
 me.name
 r.name
end
