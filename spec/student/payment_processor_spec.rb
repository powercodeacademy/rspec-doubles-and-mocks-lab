# frozen_string_literal: true

describe PaymentProcessor do
  
 context "process payment was successful" do
    it "charge the gateway correctly" do
      gateway = double("Gateway")
      allow(gateway).to receive(:charge).and_return("success")
      payment_processor = double("PaymentProcessor")
      allow(payment_processor).to receive(:process)
      processor = PaymentProcessor.new(gateway: gateway)
      processor.process(52, "shantel_324")
      expect(gateway).to have_received(:charge).with(52, "shantel_324")
    end
  end
end
