require "kemal"
require "../models/*"


post "/login-me" do |env|
  email = env.params.body["email"].as(String)
  password = env.params.body["password"].as(String)
  user = User.all.where { _email == email }.first.try(&.authenticate(password))

  success_add = false
  user_groups = user.not_nil!.community_groups
  groups = CommunityGroup.all

  render "src/views/main.ecr"
end
