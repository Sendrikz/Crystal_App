class UserRole < Jennifer::Migration::Base
  def up
    create_table :roles_users do |t|
      t.integer :user_id, { :null => false }
      t.integer :role_id, { :null => false }
    end
  end

  def down
    drop_table :roles_users if table_exists? :roles_users
  end
end
