FactoryBot.define do

  factory :post do
    association :user
    content { 'テスト投稿' }
  end
end
