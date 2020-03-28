class CommunityGroup < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    name: String,
    created_at: Time?,
    updated_at: Time?,
  )

  has_and_belongs_to_many :users, User, foreign: :community_group_id

JSON.mapping(
  id: {type: Int32, nilable: true},
  created_at: {type: Time, nilable: true},
  updated_at: {type: Time, nilable: true},
  name: String
)

end
