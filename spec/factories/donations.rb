FactoryBot.define do
  factory :donation do
    amount { 100 }

    trait :gross_up do
      gross_up { true }
    end

    trait :no_gross_up do
      gross_up { false }
    end
  end
end
