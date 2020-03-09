class CreateUsers < Jennifer::Migration::Base
  def up
    create_table :users do |t|
      t.string :name, { :null => false }
      t.string :surname, { :null => false }
      t.integer :yearOfStudy, { :null => false }
      t.date_time :birthday, { :null => false }
      t.string :faculty, { :null => false }

      t.timestamps
    end
  end

  def down
    drop_table :users if table_exists? :users
  end
end
