class RegularUser < ApplicationRecord
  before_save :set_nickname
  
  private 
  def set_nickname
    self.nickname = "#{first_name} #{last_name}"
  end
end
