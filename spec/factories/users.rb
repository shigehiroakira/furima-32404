FactoryBot.define do
  factory :user do
    
    nickname              {Faker::Name.initials(number: 2)}
    gimei = Gimei.name
    
    family_name       {Gimei.last.kanji    }
    first_name        {Gimei.first.kanji    }
    
    family_name_kana  {Gimei.last.katakana}
    first_name_kana   {Gimei.first.katakana}
    birthday                {"1930-01-01"}

    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end