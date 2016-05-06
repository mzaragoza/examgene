require 'spec_helper'

describe User do
  let(:user) { User.new }

  %w(email password first_name last_name).each do |attribute|
    it "has a #{attribute}" do
      user.send "#{attribute}=", "test string"
      expect(user.send(attribute)).to eq "test string"
    end
  end

  it "response to name" do
    user.first_name = "Moises"
    user.last_name = "Zaragoza"
    expect(user.name).to eq "Moises Zaragoza"
  end

  it { should belong_to(:account) }
  it { should have_many(:tests) }
end

