FactoryBot.define do
  factory :user do
    name                  { 'テスター' }
    uid                   { '1a' + Faker::Internet.password(min_length: 6, max_length: 14) }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
  end
end
