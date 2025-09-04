# frozen_string_literal: true

describe PaymentProcessor do
  let(:payment) { double('PaymentProcessor') }
  let(:logger)  { spy('logger') }
  let(:processor) { PaymentProcessor.new(gateway: payment, logger: logger) }

  it 'uses a double' do
    allow(payment).to receive(:charge).with(52334, 'ayoo')
    expect(processor.process(52334, 'ayoo'))
  end

  it 'uses a spy' do
    allow(payment).to receive(:charge)
    processor.process(10233, 'ayoo')
    expect(payment).to have_received(:charge).with(10233, 'ayoo')
    expect(logger).to have_received(:info).with('Charged 10233 to ayoo')
  end

end
