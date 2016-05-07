FactoryGirl.define do
  factory :question do
    name  { FFaker::Movie.title + '?' }
    before(:create) { |question| question.test = Test.last || FactoryGirl.create(:test)  }
  end
end

