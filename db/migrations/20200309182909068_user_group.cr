class UserGroup < Jennifer::Migration::Base
  def up
    create_table :community_groups_users do |t|
      t.integer :user_id,  { :null => false }
      t.integer :group_id, { :null => false }
      t.bool    :isManage, { :default => false }
    end
  end

  def down
    drop_table :community_groups_users if table_exists? :community_groups_users
  end
end
