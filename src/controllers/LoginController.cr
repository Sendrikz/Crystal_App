require "kemal"
require "../models/*"
require "kemal-session"


post "/login-me" do |env|
  email = env.params.body["email"].as(String)
  password = env.params.body["password"].as(String)
  user = User.all.where { _email == email }.first.try(&.authenticate(password)).not_nil!

  success_add = false
  user_groups = user.community_groups
  groups = CommunityGroup.all

  env.session.string("user_id", user.not_nil!.id.to_s)

  render "src/views/main.ecr"
end
