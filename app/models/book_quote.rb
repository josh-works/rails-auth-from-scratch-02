class BookQuote < ApplicationRecord
  belongs_to :regular_user
  
  def submitted_by
    regular_user
  end
end
