class Event < ActiveRecord::Base

 belongs_to :Fsesagyo
 belongs_to :Member
 belongs_to :PjMaster
 
 after_initialize :set_default, if: :new_record?
 before_update:get_changes 
 
  
  private
  def set_default()
    self.loginname = Member.current
    if self.Member_id == 22
    self.Member_id = Member.where(membername: Member.current).pluck(:id)[0]    
    end
  end
  
  def get_changes
  if self.Member_id_changed? && self.Member_id == 22
  self.Member_id = Member.where(membername: Member.current).pluck(:id)[0]
  end
  end
  
  
end