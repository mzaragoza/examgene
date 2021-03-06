require 'spec_helper'

describe Question do
  let(:question) { Question.new }

  %w(name).each do |attribute|
    it "has a #{attribute}" do
      question.send "#{attribute}=", "test string?"
      expect(question.send(attribute)).to eq "test string?"
    end
  end

  it { should belong_to(:test) }
  it { should have_many(:answers) }
  it { should validate_uniqueness_of(:name).scoped_to(:test_id).with_message("This test allredy has this question") }
end


