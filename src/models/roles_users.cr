class RolesUsers < Jennifer::Model::Base

  mapping(
    id: Primary32,
    user_id: Int32,
    role_id: Int32
  )

  belongs_to :user, User
  belongs_to :role, Role

end
