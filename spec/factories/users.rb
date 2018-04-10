FactoryBot.define do
  factory :user do

    sequence :username do |i|
      "#{i}Jimbo"
    end

    sequence :password do |i|
      "#{i}pa$$word"
    end

    sequence :email do |i|
      "#{i}jumbo@shrimp.com"
    end
  end
end
