class Messages < Jennifer::Migration::Base
  def up
    create_table :messages do |t|
      t.string :text, { :null => false }
      t.integer :to_user, { :null => false }
      t.integer :from_user, { :null => false }

      t.timestamps
    end

    add_foreign_key :messages, :users, :to_user, :id
    add_foreign_key :messages, :users, :from_user, :id
  end

  def down
    drop_table :messages if table_exists? :messages
  end
end
