require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe ".create" do
    context "3 domestic organizations, no gross up" do
      let(:organizations) { create_list :organization, 3, :domestic }
      let(:donation) { create :donation, :no_gross_up, amount: 100.00, organization_ids: organizations.map(&:id) }

      it { expect(donation.fees).to eq(3.50) }
      it { expect(donation.total_amount).to eq(100.00) }
      it { expect(donation.donation_line_items.count).to eq(3) }
      xit { expect(donation.donation_line_items.map(&:amount)).to contain_exactly(0, 0, 0) }
    end

    context "3 domestic organizations, gross up" do
      let(:organizations) { create_list :organization, 3, :domestic }
      let(:donation) { create :donation, :gross_up, amount: 100.00, organization_ids: organizations.map(&:id) }

      it { expect(donation.fees).to eq(3.50) }
      it { expect(donation.total_amount).to eq(103.50) }
      it { expect(donation.donation_line_items.count).to eq(3) }

      xit { expect(donation.donation_line_items.map(&:amount)).to contain_exactly(0, 0, 0) }
    end
  end
end
