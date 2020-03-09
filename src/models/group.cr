class Group < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    name: String,
    created_at: Time?,
    updated_at: Time?,
  )
end
