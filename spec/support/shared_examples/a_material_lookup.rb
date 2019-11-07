# frozen_string_literal: true

RSpec.shared_examples_for "a material lookup" do
  subject { base_class.for(object) }

  before { allow(base_class).to receive(:for_class).with(reference).and_return(for_class) }

  let(:object) { reference }
  let(:reference) { object_class.new }
  let(:object_class) do
    Class.new do
      include Conjunction::Conjunctive
    end
  end

  context "when nil" do
    let(:for_class) { nil }

    it { is_expected.to be_nil }
  end

  context "when present" do
    let(:for_class) { double }
    let(:example_instance) { double }

    before { allow(for_class).to receive(:new).with(object).and_return(example_instance) }

    it { is_expected.to eq example_instance }
  end
end
