class Campaign < ApplicationRecord
  paginates_per 10
  
  belongs_to :campaign_info , foreign_key: "campaign_info_id", class_name: "CampaignInfo"
end
