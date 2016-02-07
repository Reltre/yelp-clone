Fabricator :business do
  price_range { %w(1 2 3 4).sample }
  name { Faker::Lorem.word }
  address { Faker::Address.street_address }
  description { Faker::Lorem.sentence }
  phone_number { Faker::PhoneNumber.phone_number }
  time_open { [[*'01'..'12'].sample, [*'01'..'60'].sample, [" AM", "PM"].sample] }
  time_close { [[*'01'..'12'].sample, [*'01'..'60'].sample, [" AM", "PM"].sample] }
end
