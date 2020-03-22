class CommunityGroup < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    name: String,
    created_at: Time?,
    updated_at: Time?,
  )

  has_and_belongs_to_many :users, User, foreign: :user_id

end
