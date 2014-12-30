class CommentsController < ApplicationController

layout 'public'

before_action :find_subject

def index

   @section = Section.find(params[:section_id])
   @comment = Comment.new

end



def create
   

   @section = Section.find(params[:section_id])
   @comment = @section.comments.build(comment_params)

   if @comment.save

      render 'index'

   else

      render  'index'

   end

end

private

def comment_params
  
   params.require(:comment).permit(:content,:name)

end



 def find_subject

   @subjects = Subject.where(:visible=>true)

 end



end
