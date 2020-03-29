require "kemal"
require "../models/*"
require "kemal-session"


get "/join" do |env|
  group_id = env.params.query["group"].as(String)
  user_id = env.session.string("user_id")#env.params.query["user"].as(String)
  action = env.params.query["action"].as(String)

  user = User.all.where { _id == user_id }.first.not_nil!

  if action == "join"
    user = user.to_json
    env.session.string("group_id", group_id.to_s)
    render "src/views/chat.ecr"
  else
    user.deleteGroupById group_id
    success_add = false
    user_groups = user.community_groups
    groups = CommunityGroup.all

    render "src/views/main.ecr"
  end

end


get "/add-me" do |env|
  group_id = env.params.query["group"].as(String).to_i
  user_id = env.session.string("user_id")

  user = User.all.where { _id == user_id }.first.not_nil!
  user.addGroupById group_id

  success_add = true
  user_groups = user.community_groups
  groups = CommunityGroup.all

  render "src/views/main.ecr"
end
