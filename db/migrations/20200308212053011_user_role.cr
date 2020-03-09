class UserRole < Jennifer::Migration::Base
  def up
    create_table :user_role do |t|
      t.integer :user_id, { :null => false }
      t.integer :role_id, { :null => false }
    end
  end

  def down
    drop_table :user_role if table_exists? :user_role
  end
end
