FactoryGirl.define do
  factory :test do
    name      { FFaker::Movie.title }
    before(:create) { |test| test.user = User.last || FactoryGirl.create(:user)  }
    before(:create) { |test| test.account = Account.last || FactoryGirl.create(:account)  }
  end
end


