require 'spec_helper'

describe Plan do
  let(:plan) { Plan.new }

  %w(name slug).each do |attribute|
    it "has a #{attribute}" do
      plan.send "#{attribute}=", "test string"
      expect(plan.send(attribute)).to eq "test string"
    end
  end

  it "has a price" do
    plan.price = 10.50
    expect(plan.price).to eq 10.50
  end
end

