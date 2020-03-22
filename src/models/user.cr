require "jennifer/model/authentication"


class User < Jennifer::Model::Base
  include Jennifer::Model::Authentication

  with_authentication
  with_timestamps

  mapping(
    id: Primary32,
    email: String,
    password_digest: {type: String, default: ""},
    password: Password,
    password_confirmation: { type: String?, virtual: true },
    name: String,
    surname: String,
    yearOfStudy: Int32,
    faculty: String,
    created_at: Time?,
    updated_at: Time?,
  )

  has_many :messages, Message
  has_and_belongs_to_many :roles, Role, foreign: :role_id
  has_and_belongs_to_many :community_groups, CommunityGroup, foreign: :group_id

end
