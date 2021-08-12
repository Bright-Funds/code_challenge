FactoryBot.define do
  factory :donation_line_item do
    organization
    donation

    amount { 10 }
  end
end
