class Messages < Jennifer::Migration::Base
  def up
    create_table :messages do |t|
      t.string :text, { :null => false }
      t.integer :user_id, { :null => false }
      t.integer :community_group_id, { :null => false }

      t.timestamps
    end

    add_foreign_key :messages, :users, :user_id, :id
    add_foreign_key :messages, :community_groups, :community_group_id, :id
  end

  def down
    drop_table :messages if table_exists? :messages
  end
end
