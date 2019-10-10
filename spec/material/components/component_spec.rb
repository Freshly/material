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
        -> { :block_value }
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

  describe "#value_for" do
    subject(:value_for) { instance.value_for(object) }

    let(:duplicate) { double }
    let(:object) { double(dup: duplicate) }

    context "without a block" do
      let(:instance) { described_class.new }

      it { is_expected.to be_nil }
    end

    context "with a block" do
      let(:instance) { described_class.new(&block) }

      context "without args" do
        let(:block) do
          proc { Struct.new(:dup).new(:duplicated_value) }
        end

        it { is_expected.to eq :duplicated_value }
      end

      context "with args" do
        let(:block) do
          proc { self }
        end

        it { is_expected.to eq duplicate }
      end

      context "when a class" do
        let(:block) do
          proc { a_class }
        end

        let(:object) { double(a_class: a_class) }
        let(:a_class) { Class.new }

        before { allow(a_class).to receive(:dup) }

        it "is itself and not duped" do
          expect(value_for).to eq a_class
          expect(a_class).not_to have_received(:dup)
        end
      end
    end
  end

  describe "#configure" do
    shared_examples_for "the component is configured properly" do
      let(:original_options) { {} }
      let(:options) { Hash[*Faker::Lorem.words(4)].symbolize_keys }
      let(:original_block) { nil }
      let(:block) do
        -> { :block_value }
      end

      context "without arguments" do
        subject(:configure) { instance.configure }

        it "does not raise" do
          expect { configure }.not_to raise_error
        end
      end

      context "with only options" do
        subject(:configure) { instance.configure(**options) }

        it "updates options" do
          expect { configure }.to change { instance.options }.from(original_options).to(original_options.merge(options))
        end
      end

      context "with only block" do
        subject(:configure) { instance.configure(&block) }

        it "updates value" do
          expect { configure }.to change { instance.instance_variable_get(:@value) }.from(original_block).to(block)
        end
      end

      context "with options and block" do
        subject(:configure) { instance.configure(**options, &block) }

        it "updates value" do
          expect { configure }.
            to change { instance.options }.from(original_options).to(original_options.merge(options)).
            and change { instance.instance_variable_get(:@value) }.from(original_block).to(block)
        end
      end
    end

    context "without defaults" do
      it_behaves_like "the component is configured properly" do
        let(:instance) { described_class.new }
      end
    end

    context "with only original block" do
      it_behaves_like "the component is configured properly" do
        let(:instance) { described_class.new(&original_block) }
        let(:original_block) do
          -> { :original_value }
        end
      end
    end

    context "with only original options" do
      it_behaves_like "the component is configured properly" do
        let(:instance) { described_class.new(**original_options) }
        let(:original_options) { Hash[Faker::Lorem.word.to_sym, SecureRandom.hex] }
      end
    end

    context "with original options and block" do
      it_behaves_like "the component is configured properly" do
        let(:instance) { described_class.new(**original_options, &original_block) }
        let(:original_options) { Hash[Faker::Lorem.word.to_sym, SecureRandom.hex] }
        let(:options) { Hash[original_options.keys.first, SecureRandom.hex] }
        let(:original_block) do
          -> { :original_value }
        end
      end
    end
  end
end
