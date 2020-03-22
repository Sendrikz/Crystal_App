require "kemal"
require "../models/*"

post "/login-me" do |env|
  email = env.params.body["email"].as(String)
  password = env.params.body["password"].as(String)
  me = User.all.where { _email == email }.first.try(&.authenticate(password))

  name = me.not_nil!.name
  surname = me.not_nil!.surname
  render "src/views/main.ecr"
end
