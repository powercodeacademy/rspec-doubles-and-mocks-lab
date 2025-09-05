# frozen_string_literal: true

describe PaymentProcessor do
  
 context "process payment was successful" do
    it "charge the gateway correctly" do
      gateway = double("Gateway")
      allow(gateway).to receive(:charge)
      processor = PaymentProcessor.new(gateway: gateway)
      processor.process(52, "shantel_324")
      expect(gateway).to have_received(:charge).with(52, "shantel_324")
    end
  end
end
