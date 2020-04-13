require "kemal"
require "../models/*"
require "../convertors/*"
require "kemal-session"

user_convertor = UserConvertor.new
group_convertor = GroupConvertor.new

get "/join" do |env|
  group_id = env.params.query["group"].as(String)
  action = env.params.query["action"].as(String)
  session_user = env.session.object("user")

  user = user_convertor.convertUserDTOToUser(session_user)
  group = CommunityGroup.all
                        .where {_id == group_id}
                        .first.not_nil!

  if action == "join"
    session_user = session_user.to_json
    group_dto = group_convertor.convertGroupToGroupDTO(group)
    env.session.object("group", group_dto)
  else
    user.deleteGroupById(group_id)
  end

  user_groups = user.community_groups
  groups = CommunityGroup.all

  render "src/views/main.ecr", "src/views/main_layout.ecr"

end


get "/add-me" do |env|
  group_id = env.params.query["group"].as(String).to_i
  session_user = env.session.object("user")

  user = user_convertor.convertUserDTOToUser(session_user)
  user.addGroupById(group_id)
  group = CommunityGroup.all
                        .where {_id == group_id}
                        .first.not_nil!

  success_add = true
  user_groups = user.community_groups
  groups = CommunityGroup.all

  render "src/views/main.ecr", "src/views/main_layout.ecr"
end

get "/log-out" do |env|
  env.session.destroy

  render "src/views/home.ecr"
end
