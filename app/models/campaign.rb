class Campaign < ApplicationRecord
  belongs_to :campaign_info , foreign_key: "campaign_info_id", class_name: "CampaignInfo"
end
