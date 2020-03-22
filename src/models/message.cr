class Message < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    text: String,
    user_id: Int32,
    created_at: Time?,
    updated_at: Time?,
  )

  belongs_to :users, User

end
