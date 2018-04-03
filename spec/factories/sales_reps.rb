FactoryBot.define do
  factory :sales_rep do

    sequence :name do
      "#{i}Joe Johnston"
    end

    sequence :company do
      "#{i}Sysco"
    end

    sequence :category do
      "#{i}General"
    end
  end
end
