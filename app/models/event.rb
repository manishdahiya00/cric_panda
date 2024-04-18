class Event < ApplicationRecord
  belongs_to :app_offer,foreign_key: "app_offer_id",class_name: "AppOffer"
end
