FactoryBot.define do
  factory :user_purchase do
    post_code        {"331-0000"}
    prefecture_id    {1}
    city             {"さいたま市"}
    address          {"1"}
    building_name    {"ビル103"}
    phone_number     {"09000000000"}
  end
end
