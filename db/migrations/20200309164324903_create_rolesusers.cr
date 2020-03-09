class CreateRolesusers < Jennifer::Migration::Base
  def up
    create_table :rolesusers do |t|
      t.integer :user_id, { :null => false }
      t.integer :role_id, { :null => false }

      t.timestamps
    end
  end

  def down
    drop_table :rolesusers if table_exists? :rolesusers
  end
end
