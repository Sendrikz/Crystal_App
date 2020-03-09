class UserRoleFK < Jennifer::Migration::Base
  def up
    add_foreign_key :user_role, :users, :user_id, :id
    add_foreign_key :user_role, :roles, :role_id, :id
  end

  def down
    drop_foreign_key :user_role, :users, :user_id
    drop_foreign_key :user_role, :roles, :role_id
  end
end
