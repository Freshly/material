# frozen_string_literal: true

RSpec.describe Material::Components::Component, type: :subclass do
  describe "#initialize" do
    subject { instance.instance_variable_get(:@value) }

    let(:options) { {} }

    shared_examples_for "expected options are defined" do
      subject { instance.options }

      it { is_expected.to eq options }
    end

    shared_examples_for "blocks are optional" do
      it { is_expected.to be_nil }

      it_behaves_like "expected options are defined"
    end

    shared_examples_for "blocks can be assigned" do
      let(:block) do
        -> { :default_value }
      end

      it { is_expected.to eq block }

      it_behaves_like "expected options are defined"
    end

    context "without options" do
      it_behaves_like "blocks are optional" do
        let(:instance) { described_class.new }
      end

      it_behaves_like "blocks can be assigned" do
        let(:instance) { described_class.new(&block) }
      end
    end

    context "with options" do
      context "when empty" do
        it_behaves_like "blocks are optional" do
          let(:instance) { described_class.new(**options) }
        end

        it_behaves_like "blocks can be assigned" do
          let(:instance) { described_class.new(**options, &block) }
        end
      end

      context "with values" do
        let(:options) { Hash[*Faker::Lorem.words(4)].symbolize_keys }

        it_behaves_like "blocks are optional" do
          let(:instance) { described_class.new(**options) }
        end

        it_behaves_like "blocks can be assigned" do
          let(:instance) { described_class.new(**options, &block) }
        end
      end
    end
  end

  describe "#value" do
    subject { instance.value }

    context "without a block" do
      let(:instance) { described_class.new }

      it { is_expected.to be_nil }
    end

    context "with a block" do
      let(:instance) { described_class.new(&block) }
      let(:block) do
        proc { Struct.new(:dup).new(:duplicated_value) }
      end

      it { is_expected.to eq :duplicated_value }
    end
  end
end
