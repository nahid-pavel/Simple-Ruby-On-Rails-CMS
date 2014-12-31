class PublicController < ApplicationController

layout 'public'


before_action :find_subject

  
 def index

   @sections = Section.all
   
   
  
 end

  def  show

  @page = Page.where(:permalink => params[:permalink], :visible => true).first
     if @page.nil?

       redirect_to(:action=>'index')

     end

   
    
  end

 def comments_index

   

   @section = Section.find(params[:section_id])
   @comment = Comment.new

end



def create
   

   @section = Section.find(params[:section_id])
   @comment = @section.comments.build(comment_params)

   if @comment.save

      render 'comments_index'

   else

      render  'comments_index'

   end

end

 


private

 def find_subject

   @subjects = Subject.where(:visible=>true)

 end

def comment_params
  
   params.require(:comment).permit(:content,:name)

end



 end



