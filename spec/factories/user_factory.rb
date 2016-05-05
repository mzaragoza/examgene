FactoryGirl.define do
  factory :user do
    email      { FFaker::Internet.email }
    password   { 'password' }
    first_name { FFaker::Name.first_name }
    last_name  { FFaker::Name.last_name }
    before(:create) { |user| user.account = Account.last || FactoryGirl.create(:account)  }
  end
end

