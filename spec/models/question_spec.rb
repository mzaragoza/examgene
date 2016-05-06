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
end


