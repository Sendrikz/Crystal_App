require "kemal"
require "../models/*"


get "/join" do |env|
  group_id = env.params.query["group"].as(String)
  user_id = env.params.query["user"].as(String)
  action = env.params.query["action"].as(String)

  user = User.all.where { _id == user_id }.first.not_nil!

  if action == "join"
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
  user_id = env.params.query["user"].as(String).to_i

  user = User.all.where { _id == user_id }.first.not_nil!
  user.addGroupById group_id

  success_add = true
  user_groups = user.community_groups
  groups = CommunityGroup.all

  render "src/views/main.ecr"
end
