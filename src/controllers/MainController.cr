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

  if action == "join"
    session_user = session_user.to_json

    group = CommunityGroup.all
                          .where {_id == group_id}
                          .first.not_nil!
    group_dto = group_convertor.convertGroupToGroupDTO(group)
    env.session.object("group", group_dto)

    render "src/views/chat.ecr"
  else
    user = user_convertor.convertUserDTOToUser(session_user)
    user.deleteGroupById(group_id)

    success_add = false
    user_groups = user.community_groups
    groups = CommunityGroup.all

    render "src/views/main.ecr"
  end

end


get "/add-me" do |env|
  group_id = env.params.query["group"].as(String).to_i
  session_user = env.session.object("user")

  user = user_convertor.convertUserDTOToUser(session_user)
  user.addGroupById(group_id)

  success_add = true
  user_groups = user.community_groups
  groups = CommunityGroup.all

  render "src/views/main.ecr"
end
