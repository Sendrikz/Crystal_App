class CommunityGroup < Jennifer::Migration::Base
  def up
    create_table :community_groups do |t|
      t.string :name, { :null => false }

      t.timestamps
    end
  end

  def down
    drop_table :community_groups if table_exists? :community_groups
  end
end
