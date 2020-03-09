class UserGroup < Jennifer::Migration::Base
  def up
    create_table :groups_users do |t|
      t.integer :user_id,  { :null => false }
      t.integer :group_id, { :null => false }
      t.bool    :isManage, { :default => false }
    end
  end

  def down
    drop_table :groups_users if table_exists? :groups_users
  end
end
