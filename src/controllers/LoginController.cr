require "kemal"
require "../models/*"
require "../dto/*"
require "../convertors/*"
require "kemal-session"

group_convertor = GroupConvertor.new

post "/login-me" do |env|
  email = env.params.body["email"].as(String)
  password = env.params.body["password"].as(String)

  user = User.all
             .where { _email == email }.first.not_nil!
  user.loginWith(password)

  session_user = UserConvertor.new.convertUserToUserDTO(user)
  env.session.object("user", session_user)

  user_groups = user.community_groups
  groups = CommunityGroup.all

  group = CommunityGroup.all
                        .where {_name == "Main"}
                        .first.not_nil!
  group_dto = group_convertor.convertGroupToGroupDTO(group)
  env.session.object("group", group_dto)

  render "src/views/main.ecr", "src/views/main_layout.ecr"
end
