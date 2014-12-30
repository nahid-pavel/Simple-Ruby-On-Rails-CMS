module ApplicationHelper

  
  def error_messages_for(object)

    render(:partial=>"application/error_messages",:locals=>{:object=> object} ) 


  end


 def status_tag(boolean, options={})

   options['text_true'] ||=""
   options['text_false'] ||=""

  if boolean

    content_tag(:span,options['text_true'], :class=>"status true")

   else 

     content_tag(:span, options['text_false'], :class=>"status false")

  end


end

    
     





end
