require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence :first_name do |n|
      "first_name_#{n}"
    end
    sequence :last_name do |n|
      "last_name#{n}"
    end
    gender { ['male', 'female'].sample }
      
  end
end
