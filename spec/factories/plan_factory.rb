FactoryGirl.define do
  factory :plan do
    name  { FFaker::CheesyLingo.word }
    price { rand(1000) }
    before(:create) { |plan| plan.slug = plan.name.parameterize  }
  end
end

