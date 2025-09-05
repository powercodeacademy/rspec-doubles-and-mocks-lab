# frozen_string_literal: true

describe PaymentProcessor do
  let(:gateway) { double('Gateway') }
  let(:logger) { double('Logger', info: nil, error: nil) } 
  let(:processor) { PaymentProcessor.new(gateway: gateway, logger: logger) }

  describe '#process' do 
    it 'charges through the gateway and logs the transaction' do 
      expect(gateway).to receive(:charge).with(100, 'acct123').and_return(:success) 
      expect(logger).to receive(:info).with("Charged 100 to acct123") 

      result = processor.process(100, 'acct123') 
      expect(result).to eq(:success) 
    end
  end

  describe '#refund' do 
    it 'refunds through the gateway and logs the transaction' do 
      expect(gateway).to receive(:refund).with(50, 'acct123').and_return(:refunded) 
      expect(logger).to receive(:info).with("Refunded 50 to acct123") 

      result = processor.refund(50, 'acct123') 
      expect(result).to eq(:refunded) 
    end
  end


  describe 'using a PaymentProcessor double' do 
    let(:processor_double) { double('PaymentProcessor') }

    it 'can be stubbed like any dependency' do 
      allow(processor_double).to receive(:process).and_return(:fake_result)

      expect(processor_double.process(123, 'acct')).to eq(:fake_result)
      expect(processor_double).to have_received(:process).with(123, 'acct') 
    end
  end
end
