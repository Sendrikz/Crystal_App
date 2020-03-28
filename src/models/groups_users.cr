class CommunityGroupsUsers < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    user_id: Int32,
    community_group_id: Int32,
    isManage: Bool?,
    created_at: Time?,
    updated_at: Time?,
  )

  belongs_to :community_groups, CommunityGroup
  belongs_to :users, User
end
