FactoryBot.define do
  factory :restaurant do
    sequence :name do |i|
      "#{i}Fruition"
    end
    sequence :description do |i|
      "#{i}An Americana eatery focusing on locally sourced sustainable fresh ingredients."
    end
    sequence :address do |i|
      "#{i}123 Some St. Denver CO"
    end
    sequence :phone do |i|
      "#{i}720-555-5555"
    end
  end
end
