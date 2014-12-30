class AlterUsers < ActiveRecord::Migration
  def up
   
   rename_table("users","admin_users")
   add_column("admin_users","first_name",:string, :limit=>25, :after=>"email")
   rename_column("admin_users","name","username") 
   
    
 
  end

   
  def down
   
   rename_column("admin_users","username","name")
   remove_column("admin_users","first_name",:string, :limit=>25, :after=>"email")
   rename_table("admin_users","users") 
   
    
 
  end




  
end
