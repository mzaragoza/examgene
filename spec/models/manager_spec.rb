require 'spec_helper'

describe Manager do
  let(:manager) { Manager.new }

  %w(email password first_name last_name).each do |attribute|
    it "has a #{attribute}" do
      manager.send "#{attribute}=", "test string"
      expect(manager.send(attribute)).to eq "test string"
    end
  end

  it "response to name" do
    manager.first_name = "Moises"
    manager.last_name = "Zaragoza"
    expect(manager.name).to eq "Moises Zaragoza"
  end
end
