require "kemal"
require "../models/*"

get "/" do
#  Role.create(name: "Student")
#  r = User.all.relation(:roles).where { __roles { _name > "Admin" } }.to_a[0]
#  r.name
#  RolesUsers.create(user_id: 1, role_id: 2)
"Hello"
end
