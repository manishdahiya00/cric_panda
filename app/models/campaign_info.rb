class CampaignInfo < ApplicationRecord
  paginates_per 10
  
  has_many :campaign
end
