require 'spec_helper.rb'

describe Paypal::Payment::Response::Refund do
  let :attributes do
    {
      transaction_id: '0000000000000000L',
      refund_status: 'Instant'
    }
  end

  describe '.new' do
    subject { Paypal::Payment::Response::Refund.new(attributes) }
    its(:transaction_id) { should eq '0000000000000000L' }

    it 'stores refund information in info' do
      info = double(Paypal::Payment::Response::RefundInfo)
      expect(Paypal::Payment::Response::RefundInfo)
        .to receive(:new)
        .with(refund_status: 'Instant')
        .and_return(info)
      expect(subject.info).to eq info
    end
  end
end
