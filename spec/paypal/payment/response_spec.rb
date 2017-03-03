require 'spec_helper.rb'

describe Paypal::Payment::Response do
  describe '.new' do
    let :attributes do
      {
        CUSTOM: 'custom'
      }
    end

    subject { Paypal::Payment::Response.new(attributes) }
    its(:custom) { should eq 'custom' }

    context 'when non-supported attributes are given' do
      it 'should ignore them and warn' do
        Paypal.logger.should_receive(:warn).with(
          "Ignored Parameter (Paypal::Payment::Response): ignored=Ignore me!"
        )
        response = Paypal::Payment::Response.new(
          :ignored => 'Ignore me!'
        )
      end
    end
  end
end
