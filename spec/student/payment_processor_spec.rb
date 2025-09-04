# frozen_string_literal: true

describe PaymentProcessor do

  describe "#initialize"
    it "initializes with a gateway and logger" do
      processor = instance_double("PaymentProcessor", gateway: "venmo")
      allow(processor).to receive(:gateway).and_return("venmo")
      allow(processor).to receive(:logger).and_return(nil)
    end

  describe "#process"
    it "returns a result with valid arguments" do

    end

  describe "#process" do
    it "charges the gateway and logs info" do
      gateway = double("Gateway", charge: "ok")
      logger = spy("Logger")
      processor = PaymentProcessor.new(gateway: gateway, logger: logger)

      result = processor.process(100, "acct_123")

      expect(result).to eq("ok")
      expect(logger).to have_received(:info).with("Charged 100 to acct_123")
    end
  end

end
