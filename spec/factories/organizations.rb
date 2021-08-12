FactoryBot.define do
  factory :organization do
    sequence(:name) {|n| "organization #{n}" }
    international { false }

    trait :domestic do
      international { false }
    end

    trait :international do
      international { true }
    end
  end
end
