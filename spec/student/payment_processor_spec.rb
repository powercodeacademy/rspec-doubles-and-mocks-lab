# frozen_string_literal: true

describe PaymentProcessor do
  
 context "process payment was successful" do
    it "charge the gateay correctly" do
      gateway = double("Gateway")
      allow(gateway).to receive(:charge)
      processor = PaymentProcessor.new(gateway: gateway, logger: logger)
      processor.process(amount, amount)
      expect(gateway).to have_received(:charge).with(amount, amount)
    end
  end
end
