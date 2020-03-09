class User < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    name: String,
    surname: String,
    yearOfStudy: Int32,
    birthday: Time?,
    faculty: String,
    created_at: Time?,
    updated_at: Time?,
  )

  has_many :messages, Message 
  has_and_belongs_to_many :roles, Role, foreign: :role_id
end
