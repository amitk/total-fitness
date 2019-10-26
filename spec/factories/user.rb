FactoryBot.define do
  factory :user do
    sequence :first_name do |n|
      "first_name_#{n}"
    end
    sequence :last_name do |n|
      "last_name#{n}"
    end
    password { SecureRandom.hex(8) }
    gender { ['male', 'female'].sample }
    mobile { "7767983579" }
    sequence :email do |n|
      "email_#{n}@example.com"
    end
  end
end
