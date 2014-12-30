class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|

      t.string "name", :limit=> 30
      t.string "email",:default=>"",:null=>false
      t.string "password", :limit=>6
      t.timestamps
    end
  end

  def down
    drop_table :users 
  end
end
