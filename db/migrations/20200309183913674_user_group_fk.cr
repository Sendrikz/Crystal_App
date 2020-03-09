class UserGroupFK < Jennifer::Migration::Base
  def up
    add_foreign_key :groups_users, :users, :user_id, :id
    add_foreign_key :groups_users, :community_groups, :group_id, :id
  end

  def down
    add_foreign_key :groups_users, :users, :user_id
    add_foreign_key :groups_users, :community_groups, :group_id
  end
end
