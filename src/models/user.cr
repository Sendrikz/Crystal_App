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
    year_of_study: Int32,
    faculty: String,
    created_at: Time?,
    updated_at: Time?
  )

  has_many :messages, Message
  has_and_belongs_to_many :roles, Role, foreign: :role_id
  has_and_belongs_to_many :community_groups, CommunityGroup, foreign: :user_id


  def addRole(role_name)
    student_role = Role.all.where { _name == role_name }.first.not_nil!
    user = User.all.where {_email == self.email}.first.not_nil!
    RolesUsers.create(user_id: user.id, role_id: student_role.id)
  end

  def addGroupById(group_id)
    group = CommunityGroup.all.where { _id == group_id }.first.not_nil!
    user = User.all.where {_email == self.email}.first.not_nil!
    CommunityGroupsUsers.create(user_id: user.id, community_group_id: group.id)
  end

  def deleteGroupById(group_id)
    user = User.all.where {_email == self.email}.first
    community_group = CommunityGroupsUsers.all.where{ and(_user_id == user.id, _community_group_id == group_id)}.first.not_nil!
    CommunityGroupsUsers.delete(community_group.id)
  end

  def loginWith(password)
    self.try(&.authenticate(password)).not_nil!
  end

end
