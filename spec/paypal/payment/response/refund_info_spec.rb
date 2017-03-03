require 'spec_helper.rb'

describe Paypal::Payment::Response::RefundInfo do
  let :attributes do
    {
      refund_status: 'Instant'
    }
  end

  describe '.new' do
    subject { Paypal::Payment::Response::RefundInfo.new(attributes) }
    its(:refund_status) { should eq 'Instant' }
  end
end
