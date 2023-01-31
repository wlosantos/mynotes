FactoryBot.define do
  factory :note do
    title { Faker::Lorem.sentence(word_count: 3) }
    priority { %i[low medium high].sample }
    content { Faker::Lorem.paragraph(sentence_count: 3) }
    user
  end
end
