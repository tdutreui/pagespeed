FactoryBot.define do
  factory :page do
    url { "github.com" }
    factory :page2 do
      url { "hey.com" }
    end
  end
end
