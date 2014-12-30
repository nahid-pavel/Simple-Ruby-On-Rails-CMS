class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def login



  end

 def reditect_to_or(default)
   
     redirect_to (session[:redirect_to] || default)

  end

  def store_location
    
     session[:redirect_to] = request.fullpath
   
  end
  def attempt_login
   
    if params[:username].present? && params[:password].present?

      find_user = AdminUser.where(:username=>params[:username]).first

   if find_user
       authenticate_user = find_user.authenticate(params[:password])

     end


    if authenticate_user 

 
         session[:user_id]=find_user.id
         session[:username]=find_user.username
         
         flash[:notice]= "You are successfully logged in"
         
         
         reditect_to_or({:controller=>"admin", :action=> "index"})
         

       else 

          flash[:notice]= "Doesn't match username/password"
          redirect_to ({:action=>'login'})


     end


  end

end


  def logout
    
    session[:user_id]=nil
    session[:username]=nil
    flash[:notice]= "You are successfully logged out"
    redirect_to ({:action=>'login'})

  end

  

  def validate_user 

      unless  session[:user_id]
         
        store_location
 
        flash[:notice]= "You are not logged in"
     
        redirect_to ({:controller=> 'access', :action=>'login'})
       end

    end

 
	    def find_subject
	      if params[:subject_id]
		@subject = Subject.find(params[:subject_id])
	       
	      
	      end
	    end

end
