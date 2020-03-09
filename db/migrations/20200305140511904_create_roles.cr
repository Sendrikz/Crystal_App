class CreateRoles < Jennifer::Migration::Base
  def up
    create_table :roles do |t|
      t.string :name, { :null => false }

      t.timestamps
    end
  end

  def down
    drop_table :roles if table_exists? :roles
  end
end
