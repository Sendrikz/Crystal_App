require "kemal"
require "../models/*"
require "../dto/*"
require "../convertors/*"
require "kemal-session"


post "/login-me" do |env|
  email = env.params.body["email"].as(String)
  password = env.params.body["password"].as(String)

  user = User.all
             .where { _email == email }.first.not_nil!
  user.loginWith(password)

  session_user = UserConvertor.new.convertUserToUserDTO(user)
  env.session.object("user", session_user)

  success_add = false
  user_groups = user.community_groups
  groups = CommunityGroup.all

  render "src/views/main.ecr"
end
