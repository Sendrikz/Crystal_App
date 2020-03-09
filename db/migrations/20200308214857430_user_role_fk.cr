class UserRoleFK < Jennifer::Migration::Base
  def up
    add_foreign_key :roles_users, :users, :user_id, :id
    add_foreign_key :roles_users, :roles, :role_id, :id
  end

  def down
    drop_foreign_key :roles_users, :users, :user_id
    drop_foreign_key :roles_users, :roles, :role_id
  end
end
