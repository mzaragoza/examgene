FactoryGirl.define do
  factory :account do
    domain  { FFaker::Internet.domain_word }
    name    { FFaker::HipsterIpsum.word }
    website { FFaker::Internet.domain_name }
    before(:create) { |account| account.plan = Plan.last || FactoryGirl.create(:plan)  }
  end
end

