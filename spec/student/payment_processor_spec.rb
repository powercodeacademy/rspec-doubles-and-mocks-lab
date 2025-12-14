# frozen_string_literal: true

describe PaymentProcessor do
  let(:payment_processor) { instance_double("PaymentProcessor") }

  it "stubs a method" do
    allow(payment_processor).to receive(:process).with(100, "ABC123").and_return("processed")
    expect(payment_processor.process(100, "ABC123")).to eq("processed")
  end

  it "verifies a method call" do
    allow(payment_processor).to receive(:refund)
    payment_processor.refund(50, "ABC123")
    expect(payment_processor).to have_received(:refund).with(50, "ABC123")
  end
end
