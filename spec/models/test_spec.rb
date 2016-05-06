require 'spec_helper'

describe Test do
  let(:test) { Test.new }

  %w(name).each do |attribute|
    it "has a #{attribute}" do
      test.send "#{attribute}=", "test string"
      expect(test.send(attribute)).to eq "test string"
    end
  end

  it { should belong_to(:account) }
  it { should belong_to(:user) }
end


