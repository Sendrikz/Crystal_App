class CreateUsers < Jennifer::Migration::Base
  def up
    create_table :users do |t|
      t.string :email, { :null => false }
      t.string :password_digest, { :null => false }
      t.string :name, { :null => false }
      t.string :surname, { :null => false }
      t.integer :year_of_study, { :null => false }
      t.string :faculty, { :null => false }

      t.timestamps
    end
  end

  def down
    drop_table :users if table_exists? :users
  end
end
