class Subject < ActiveRecord::Base



  
  has_many :pages, dependent: :destroy

  acts_as_list

  validates :name,:presence=>true,
                  :uniqueness=>true,
                  :length=>{:maximum=>25}


  validates :position,:presence=>true
                  
                  

  scope :visible, lambda{ where(:visible=> true) }
  scope :invisible, lambda{ where(:visible=> false) }
  scope :sorted, lambda{ order("subjects.position ASC") }
  scope :newest_first, lambda{ order("subjects.created_at DESC") }

 scope :search, lambda{|query| 
               where(["name LIKE ?","%#{query}%" ])

             }


end
