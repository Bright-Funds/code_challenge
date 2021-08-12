class DonationLineItem < ApplicationRecord
  belongs_to :donation
  belongs_to :organization

  validates_presence_of :donation, :organization, :amount
end
