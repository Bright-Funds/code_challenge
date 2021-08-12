class Donation < ApplicationRecord
  has_many :donation_line_items
  validates_presence_of :amount

  attr_accessor :organization_ids

  after_create :create_donation_line_items

  private

  def create_donation_line_items
    self.fees = amount * 0.035
    self.total_amount = self.fees

    length = organization_ids&.length || 1
    amount_per_organization = (amount - fees) / length

    organization_ids&.each do |organization_id|
      self.total_amount += amount_per_organization

      self.donation_line_items << DonationLineItem.new(
        amount: amount_per_organization,
        organization_id: organization_id
      )
    end
  end
end
