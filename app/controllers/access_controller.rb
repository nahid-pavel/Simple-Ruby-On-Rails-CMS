class AccessController < ApplicationController

  layout 'admin'
   
   
   before_action :validate_user, :except=>[:login, :attempt_login,:logout]
   before_action :find_subject

  def index

   


  end

  

    
end
