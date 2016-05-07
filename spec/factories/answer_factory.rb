FactoryGirl.define do
  factory :answer do
    name  { FFaker::Movie.title  }
    before(:create) { |answer| answer.question = Question.last || FactoryGirl.create(:question)  }
  end
end


