class AdminUserController < ApplicationController

  layout 'admin'


  def index
   
    @admin_users = AdminUser.sort_first
   
  end

  def new
  end

 def create
   
  @admin_user = AdminUser.new(admin_params)

   if @admin_user.save
      
      flash[:notice]= "Admin User Created"
      redirect_to ({:action=>"index"})

    else
       
      
      render 'new'
      
     
  end

end

  def edit
  
    @admin_user = AdminUser.find(params[:id])
  
  end

  def update

   @admin_user = AdminUser.find(params[:id])
      
    if @admin_user.update_attributes(admin_params)
       
       flash[:notice]= "Udated"
       redirect_to ({:action=>"index"})

    else
 
       render 'edit'
   
     end
      
   
  end

  def delete

    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
   
     @admin_user = AdminUser.find(params[:id]).destroy


      
       flash[:notice]= "Deleted"
       redirect_to ({:action=>"index"})


  end

 private

  def admin_params

    params.require(:admin_user).permit(:first_name,:last_name,:username,:password,:password_confirmation)


  end
end
