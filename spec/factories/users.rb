FactoryGirl.define do
  factory :user do

    sequence :username do |i|
      "#{i}Jimbo"
    end

    sequence :password_digest do |i|
      "#{i}pa$$word"
    end

  end
end
