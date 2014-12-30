class SubjectsController < ApplicationController
 
 layout 'admin'

  before_action :find_subject

  def index
   
    @subjects = Subject.sorted

  end

  

  def new

   @subject = Subject.new

  end


  def create

    @subject = Subject.create(subject_params)

    if @subject.save
       
        flash[:notice]= "Subject Created successfully"

        redirect_to ({:action=> :index})

    else

       render 'new'

    end



  end

  def edit
    
    @subject = Subject.find(params[:id])

   
 end


 def update

 @subject = Subject.find(params[:id])

   if @subject.update_attributes(subject_params)

       flash[:notice]= "Subject Updated Successfully"
     
       redirect_to subject_path(:id=>@subject.id)

 

   else

        render 'edit'


    end

  end

def show

    @subject = Subject.find(params[:id])

  end


  def delete

   @subject = Subject.find(params[:id])

  end

 def destroy

   subject = Subject.find(params[:id]).destroy

   
   flash[:notice]= "Subject deleted successfully"

   redirect_to ({:action=> :index})
  


  end

private


  def subject_params

    params.require(:subject).permit(:name,:position,:visible)

  end
end
