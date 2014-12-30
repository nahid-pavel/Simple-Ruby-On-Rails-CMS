class Page < ActiveRecord::Base

  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many  :editors, :class_name => "AdminUser"

  acts_as_list :scope=> :subject
 
  scope :visible, lambda{where(:visible=>true)}

  scope :sorted, lambda{order('created_at DESC')}


   validates_presence_of  :name

   validates_length_of  :name, :maximum=> 255

   validates_presence_of  :permalink

    validates_length_of  :permalink, :maximum=> 100

    validates_presence_of  :position
  
   


end
