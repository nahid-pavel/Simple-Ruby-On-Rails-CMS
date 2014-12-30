class PagesController < ApplicationController


layout 'admin'

before_action :validate_user, :except=>[:login,:attempt_login,:logout]
before_action :find_subject

def index

	if @subject
	 
	  @pages = @subject.pages.sorted
	else
	  
	  @pages = Page.all

	end
  

end





def new
  
   if @subject
   @page = Page.new({:subject_id => @subject.id, :name => "Default"})
   
   @subjects = Subject.order('created_at DESC')
   @page_count = Page.count+1
   else

   @page = Page.new({ :name => "Default"})
   
   @subjects = Subject.order('created_at DESC')
   @page_count = Page.count+1

   end

end
  
  






def create

@page = Page.new(page_params)

 if @page.save

  
         flash[:notice]= "Pages Created Successfully"

	  
         
	  if @subject
          redirect_to pages_path(:subject_id=>@subject.id)
          else 
           redirect_to pages_path
         end 
   
	 @page_count = Page.count+1
  
   else

      @subjects = Subject.order('position ASC')
      @page_count = Page.count + 1
      render 'new'

 end

end

def edit

  @page = Page.find(params[:id])
  @page_count = Page.count+1
  @subjects = Subject.order('created_at DESC')


end


def update

    @page = Page.find(params[:id])
    @page_count = Page.count+1

   if @page.update_attributes(page_params)


    flash[:notice]= "Updated Successfully"
    
    
      redirect_to page_path(:page_id=>@page.id)
      @page_count = Page.count+1
     
     
    end

end

def  show 

  @page = Page.find(params[:id])

end


def delete

 @page = Page.find(params[:id])

end


def destroy

  page = Page.find(params[:id]).destroy

  flash.now[:notice] = "#{page.name} has been deleted"

  redirect_to pages_path


end

private


 def page_params

  params.require(:page).permit(:subject_id,:name,:permalink,:position,:visible)

 end

 




end
