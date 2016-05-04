require 'spec_helper'

describe Account do
  let(:account) { Account.new }

  %w(domain  name  logo  website  stripe_customer_id stripe_customer).each do |attribute|
    it "has a #{attribute}" do
      account.send "#{attribute}=", "test string"
      expect(account.send(attribute)).to eq "test string"
    end
  end

end

