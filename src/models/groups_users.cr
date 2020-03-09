class GroupsUsers < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    user_id: Int32,
    group_id: Int32,
    isManage: Bool,
    created_at: Time?,
    updated_at: Time?,
  )

  belongs_to :user, User
  belongs_to :group, Group
end
