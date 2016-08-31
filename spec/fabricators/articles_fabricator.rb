Fabricator(:article) do
  title { Faker::Lorem.sentence }
  text { Faker::Lorem.paragraph }
end
