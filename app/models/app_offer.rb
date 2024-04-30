class AppOffer < ApplicationRecord
  paginates_per 10
  
  has_many :events
end
